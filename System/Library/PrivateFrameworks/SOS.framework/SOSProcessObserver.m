@implementation SOSProcessObserver

- (SOSProcessObserver)initWithBundleIdentifier:(id)a3
{
  id v4;
  SOSProcessObserver *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BKSApplicationStateMonitor *applicationMonitor;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SOSProcessObserver;
  v5 = -[SOSProcessObserver init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CFE2F0]);
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithBundleIDs:states:", v7, 0);
    applicationMonitor = v5->_applicationMonitor;
    v5->_applicationMonitor = (BKSApplicationStateMonitor *)v8;

    objc_initWeak(&location, v5);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__SOSProcessObserver_initWithBundleIdentifier___block_invoke;
    v11[3] = &unk_1E5F76B70;
    objc_copyWeak(&v12, &location);
    -[BKSApplicationStateMonitor setHandler:](v5->_applicationMonitor, "setHandler:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __47__SOSProcessObserver_initWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2A8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "applicationMonitorStateDidChangeForBundleIdentifier:", v4);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SOSProcessObserver applicationMonitor](self, "applicationMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SOSProcessObserver;
  -[SOSProcessObserver dealloc](&v4, sel_dealloc);
}

- (void)applicationMonitorStateDidChangeForBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_opt_class();
  -[SOSProcessObserver applicationMonitor](self, "applicationMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isApplicationStateRunning:", objc_msgSend(v5, "applicationStateForApplication:", v9));

  if ((_DWORD)v6 != -[SOSProcessObserver cachedApplicationRunning](self, "cachedApplicationRunning"))
  {
    -[SOSProcessObserver setCachedApplicationRunning:](self, "setCachedApplicationRunning:", v6);
    -[SOSProcessObserver delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SOSProcessObserver delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "processObserver:bundleIdentifier:didUpdateApplicationRunning:", self, v9, v6);

    }
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj)
    {
      v6 = (void *)objc_opt_class();
      -[SOSProcessObserver applicationMonitor](self, "applicationMonitor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOSProcessObserver applicationMonitor](self, "applicationMonitor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "interestedBundleIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOSProcessObserver setCachedApplicationRunning:](self, "setCachedApplicationRunning:", objc_msgSend(v6, "isApplicationStateRunning:", objc_msgSend(v7, "applicationStateForApplication:", v10)));

      -[SOSProcessObserver applicationMonitor](self, "applicationMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = *MEMORY[0x1E0CFE290];
    }
    else
    {
      -[SOSProcessObserver applicationMonitor](self, "applicationMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = 0;
    }
    objc_msgSend(v11, "updateInterestedStates:", v13);

    v5 = obj;
  }

}

+ (BOOL)isApplicationStateRunning:(unsigned int)a3
{
  return a3 > 4 || (a3 & 0x1F) == 3;
}

- (SOSProcessObserverDelegate)delegate
{
  return (SOSProcessObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BKSApplicationStateMonitor)applicationMonitor
{
  return self->_applicationMonitor;
}

- (BOOL)cachedApplicationRunning
{
  return self->_cachedApplicationRunning;
}

- (void)setCachedApplicationRunning:(BOOL)a3
{
  self->_cachedApplicationRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
