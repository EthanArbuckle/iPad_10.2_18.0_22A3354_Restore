@implementation PKDiscoveryLSWatcher

- (PKDiscoveryLSWatcher)initWithDriver:(id)a3
{
  id v4;
  PKDiscoveryLSWatcher *v5;
  PKDiscoveryLSWatcher *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDiscoveryLSWatcher;
  v5 = -[PKDiscoveryLSWatcher init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKDiscoveryLSWatcher setWdriver:](v5, "setWdriver:", v4);
    objc_msgSend(v4, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "external");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ls");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultApplicationWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryLSWatcher setWorkspace:](v6, "setWorkspace:", v10);

    -[PKDiscoveryLSWatcher workspace](v6, "workspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:", v6);

  }
  return v6;
}

- (PKApplicationWorkspaceProxy)workspace
{
  return (PKApplicationWorkspaceProxy *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWorkspace:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setWdriver:(id)a3
{
  objc_storeWeak((id *)&self->_wdriver, a3);
}

- (void)stopUpdates
{
  id v3;

  -[PKDiscoveryLSWatcher workspace](self, "workspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)pluginsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pklog_handle_for_category(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKDiscoveryLSWatcher wdriver](self, "wdriver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218240;
    v8 = v6;
    v9 = 2048;
    v10 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1AF254000, v5, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> new plugin(s) (count: %lu) installed, re-performing query for continuous discovery", (uint8_t *)&v7, 0x16u);

  }
  -[PKDiscoveryLSWatcher update](self, "update");

}

- (void)pluginsDidUninstall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pklog_handle_for_category(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKDiscoveryLSWatcher wdriver](self, "wdriver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218240;
    v8 = v6;
    v9 = 2048;
    v10 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1AF254000, v5, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> plugin(s) (count: %lu) uninstalled", (uint8_t *)&v7, 0x16u);

  }
  -[PKDiscoveryLSWatcher updateWithUninstalledProxies:](self, "updateWithUninstalledProxies:", v4);

}

- (void)update
{
  -[PKDiscoveryLSWatcher updateWithUninstalledProxies:](self, "updateWithUninstalledProxies:", MEMORY[0x1E0C9AA60]);
}

- (void)updateWithUninstalledProxies:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[PKDiscoveryLSWatcher wdriver](self, "wdriver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1AF263520;
    v8[3] = &unk_1E5F40650;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

- (PKDiscoveryDriver)wdriver
{
  return (PKDiscoveryDriver *)objc_loadWeakRetained((id *)&self->_wdriver);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_destroyWeak((id *)&self->_wdriver);
}

@end
