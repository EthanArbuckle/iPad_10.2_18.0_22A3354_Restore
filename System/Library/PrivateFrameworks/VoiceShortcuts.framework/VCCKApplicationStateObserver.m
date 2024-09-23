@implementation VCCKApplicationStateObserver

void __57__VCCKApplicationStateObserver_initWithBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __VCApplicationPresentInLayout_block_invoke;
  v10[3] = &unk_1E7AA5FA8;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "if_firstObjectPassingTest:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v9 != 0) != objc_msgSend(WeakRetained, "isApplicationVisible"))
    objc_msgSend(WeakRetained, "setApplicationVisible:", v9 != 0);

}

- (BOOL)isApplicationVisible
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_atomicApplicationVisible);
  return v2 & 1;
}

- (void)setApplicationVisible:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_atomicApplicationVisible);
}

- (VCCKApplicationStateObserver)initWithBundleIdentifier:(id)a3
{
  id v5;
  VCCKApplicationStateObserver *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  FBSDisplayLayoutMonitor *layoutMonitor;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _BOOL8 v19;
  VCCKApplicationStateObserver *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  objc_super v27;
  _QWORD v28[4];
  id v29;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCKApplicationStateObserver.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v27.receiver = self;
  v27.super_class = (Class)VCCKApplicationStateObserver;
  v6 = -[VCCKApplicationStateObserver init](&v27, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    atomic_store(0, (unsigned __int8 *)&v6->_atomicApplicationVisible);
    objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v6);
    v10 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __57__VCCKApplicationStateObserver_initWithBundleIdentifier___block_invoke;
    v23[3] = &unk_1E7AA5F80;
    objc_copyWeak(&v25, &location);
    v11 = v5;
    v24 = v11;
    objc_msgSend(v9, "setTransitionHandler:", v23);
    objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    layoutMonitor = v6->_layoutMonitor;
    v6->_layoutMonitor = (FBSDisplayLayoutMonitor *)v12;

    -[FBSDisplayLayoutMonitor currentLayout](v6->_layoutMonitor, "currentLayout");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(v14, "elements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __VCApplicationPresentInLayout_block_invoke;
    v28[3] = &unk_1E7AA5FA8;
    v17 = v15;
    v29 = v17;
    objc_msgSend(v16, "if_firstObjectPassingTest:", v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 != 0;

    -[VCCKApplicationStateObserver setApplicationVisible:](v6, "setApplicationVisible:", v19);
    v20 = v6;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VCCKApplicationStateObserver;
  -[VCCKApplicationStateObserver dealloc](&v3, sel_dealloc);
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)atomicApplicationVisible
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_atomicApplicationVisible);
  return v2 & 1;
}

- (void)setAtomicApplicationVisible:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_atomicApplicationVisible);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end
