@implementation SUInstaller

- (SUInstaller)initWithCore:(id)a3
{
  id v4;
  SUInstaller *v5;
  SUInstaller *v6;
  SUAutoUpdatePasscodePolicy *passcodePolicy;
  SUInstallOptions *currentInstallOptions;
  SUInvalidatable *installDeviceLockAssertion;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  SUInstallPolicy *installPolicy;
  SUInstallPolicy *v14;
  SUInstallPolicy *v15;
  SUInstaller *v16;
  const char *v17;
  id v18;
  NSObject *v19;
  _QWORD handler[4];
  SUInstaller *v22;
  _QWORD *v23;
  _QWORD v24[5];
  SUInstaller *v25;
  int out_token;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUInstaller;
  v5 = -[SUInstaller init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_core, v4);
    *(_DWORD *)&v6->_installing = 0;
    v6->_isInstallTonightScheduled = 0;
    passcodePolicy = v6->_passcodePolicy;
    v6->_passcodePolicy = 0;

    currentInstallOptions = v6->_currentInstallOptions;
    v6->_currentInstallOptions = 0;

    installDeviceLockAssertion = v6->_installDeviceLockAssertion;
    v6->_installDeviceLockAssertion = 0;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_core);
    objc_msgSend(WeakRetained, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "installPolicy");
    v12 = objc_claimAutoreleasedReturnValue();
    installPolicy = v6->_installPolicy;
    v6->_installPolicy = (SUInstallPolicy *)v12;

    if (!v6->_installPolicy)
    {
      v14 = -[SUInstallPolicy initWithInstallPolicyType:]([SUInstallPolicy alloc], "initWithInstallPolicyType:", 0);
      v15 = v6->_installPolicy;
      v6->_installPolicy = v14;

    }
    out_token = -1;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__11;
    v24[4] = __Block_byref_object_dispose__11;
    v16 = v6;
    v25 = v16;
    v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(CFSTR("SUPreferencesChangedNotificationAutoUpdate")), "UTF8String");
    v18 = objc_loadWeakRetained((id *)&v6->_core);
    objc_msgSend(v18, "workQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __28__SUInstaller_initWithCore___block_invoke;
    handler[3] = &unk_24CE3CD18;
    v22 = v16;
    v23 = v24;
    notify_register_dispatch(v17, &out_token, v19, handler);

    _Block_object_dispose(v24, 8);
  }

  return v6;
}

void __28__SUInstaller_initWithCore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  SULogInfo(CFSTR("%s: Got AutoUpdate preference change notification, reloading preferences"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUInstaller initWithCore:]_block_invoke");
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reload");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v10 = objc_msgSend(WeakRetained, "isAutoUpdateEnabled");

  SULogInfo(CFSTR("%s: Calling updateInstallPolicyAutoUpdateEnabled:%d"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUInstaller initWithCore:]_block_invoke");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "updateInstallPolicyAutoUpdateEnabled:", v10);

}

- (BOOL)isInstalling
{
  void *v3;
  NSObject *v4;

  -[SUInstaller core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_installing;
}

- (void)setInstalling:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;

  v3 = a3;
  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_installing != v3)
  {
    self->_installing = v3;
    +[SUNetworkMonitor setHoldsWiFiAssertion:](SUNetworkMonitor, "setHoldsWiFiAssertion:", v3);
  }
}

- (BOOL)isInstalled
{
  void *v3;
  NSObject *v4;

  -[SUInstaller core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  void *v5;
  NSObject *v6;

  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  self->_installed = a3;
}

- (BOOL)isInstallTonight
{
  void *v3;
  NSObject *v4;

  -[SUInstaller core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_isInstallTonight;
}

- (void)setIsInstallTonight:(BOOL)a3
{
  void *v5;
  NSObject *v6;

  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  self->_isInstallTonight = a3;
}

- (BOOL)isInstallTonightScheduled
{
  void *v3;
  NSObject *v4;

  -[SUInstaller core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_isInstallTonightScheduled;
}

- (void)setIsInstallTonightScheduled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  BOOL v20;

  v3 = a3;
  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_isInstallTonightScheduled != v3)
  {
    SULogInfo(CFSTR("%s: Setting isInstallTonightScheduled to %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUInstaller setIsInstallTonightScheduled:]");
    self->_isInstallTonightScheduled = v3;
    -[SUInstaller core](self, "core");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[SUInstaller core](self, "core");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "externWorkQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __44__SUInstaller_setIsInstallTonightScheduled___block_invoke;
      block[3] = &unk_24CE3BB60;
      block[4] = self;
      v20 = v3;
      dispatch_async(v18, block);

    }
  }
}

void __44__SUInstaller_setIsInstallTonightScheduled___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installTonightScheduled:", *(unsigned __int8 *)(a1 + 40));

}

- (SUAutoUpdatePasscodePolicy)passcodePolicy
{
  void *v3;
  NSObject *v4;

  -[SUInstaller core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_passcodePolicy;
}

- (void)setPasscodePolicy:(id)a3
{
  SUAutoUpdatePasscodePolicy *v4;
  void *v5;
  NSObject *v6;
  SUAutoUpdatePasscodePolicy *passcodePolicy;

  v4 = (SUAutoUpdatePasscodePolicy *)a3;
  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  passcodePolicy = self->_passcodePolicy;
  self->_passcodePolicy = v4;

}

- (SUInstallPolicy)installPolicy
{
  void *v3;
  NSObject *v4;

  -[SUInstaller core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_installPolicy;
}

- (void)setInstallPolicy:(id)a3
{
  SUInstallPolicy *v4;
  void *v5;
  NSObject *v6;
  SUInstallPolicy *installPolicy;

  v4 = (SUInstallPolicy *)a3;
  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  installPolicy = self->_installPolicy;
  self->_installPolicy = v4;

}

- (void)updateInstallPolicyType:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  SUInstallPolicy *v14;
  void *v15;
  NSObject *v16;
  SUInstallPolicy *v17;
  _QWORD v18[5];
  SUInstallPolicy *v19;

  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[SUInstallPolicy type](self->_installPolicy, "type") != a3)
  {
    -[SUInstallPolicy _setType:](self->_installPolicy, "_setType:", a3);
    -[SUInstaller core](self, "core");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInstallPolicy:", self->_installPolicy);

    -[SUInstaller core](self, "core");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "save");

    -[SUInstaller core](self, "core");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = self->_installPolicy;
      -[SUInstaller core](self, "core");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "externWorkQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __39__SUInstaller_updateInstallPolicyType___block_invoke;
      v18[3] = &unk_24CE3B610;
      v18[4] = self;
      v19 = v14;
      v17 = v14;
      dispatch_async(v16, v18);

    }
  }
}

void __39__SUInstaller_updateInstallPolicyType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installPolicyDidChange:", *(_QWORD *)(a1 + 40));

}

- (void)updateInstallPolicyAutoUpdateEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  SUInstallPolicy *v14;
  void *v15;
  NSObject *v16;
  SUInstallPolicy *v17;
  _QWORD v18[5];
  SUInstallPolicy *v19;

  v3 = a3;
  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[SUInstallPolicy autoUpdateEnabled](self->_installPolicy, "autoUpdateEnabled") != v3)
  {
    -[SUInstallPolicy _setAutoUpdateEnabled:](self->_installPolicy, "_setAutoUpdateEnabled:", v3);
    -[SUInstaller core](self, "core");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInstallPolicy:", self->_installPolicy);

    -[SUInstaller core](self, "core");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "save");

    -[SUInstaller core](self, "core");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = self->_installPolicy;
      -[SUInstaller core](self, "core");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "externWorkQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __52__SUInstaller_updateInstallPolicyAutoUpdateEnabled___block_invoke;
      v18[3] = &unk_24CE3B610;
      v18[4] = self;
      v19 = v14;
      v17 = v14;
      dispatch_async(v16, v18);

    }
  }
}

void __52__SUInstaller_updateInstallPolicyAutoUpdateEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installPolicyDidChange:", *(_QWORD *)(a1 + 40));

}

- (void)updateInstallPolicyDarkBootEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];

  v3 = a3;
  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[SUInstallPolicy useDarkBoot](self->_installPolicy, "useDarkBoot") != v3)
  {
    -[SUInstallPolicy _setDarkBoolEnabled:](self->_installPolicy, "_setDarkBoolEnabled:", v3);
    -[SUInstaller core](self, "core");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInstallPolicy:", self->_installPolicy);

    -[SUInstaller core](self, "core");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "save");

    -[SUInstaller core](self, "core");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[SUInstaller core](self, "core");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "externWorkQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __50__SUInstaller_updateInstallPolicyDarkBootEnabled___block_invoke;
      block[3] = &unk_24CE3B5C0;
      block[4] = self;
      dispatch_async(v15, block);

    }
  }
}

void __50__SUInstaller_updateInstallPolicyDarkBootEnabled___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;
  void *v3;
  id v4;

  v1 = *(id **)(a1 + 32);
  v2 = v1[3];
  objc_msgSend(v1, "core");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installPolicyDidChange:", v2);

}

- (void)updateInstallPolicyClientName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];

  v4 = a3;
  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUInstallPolicy clientName](self->_installPolicy, "clientName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
  {
    v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("dmd"));

    if (v8)
      -[SUInstaller managedInstallRequested](self, "managedInstallRequested");
  }
  else
  {
    -[SUInstallPolicy _setClientName:](self->_installPolicy, "_setClientName:", v4);

    -[SUInstaller core](self, "core");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInstallPolicy:", self->_installPolicy);

    -[SUInstaller core](self, "core");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "save");

    -[SUInstaller core](self, "core");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[SUInstaller core](self, "core");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "externWorkQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__SUInstaller_updateInstallPolicyClientName___block_invoke;
      block[3] = &unk_24CE3B5C0;
      block[4] = self;
      dispatch_async(v17, block);

    }
  }
}

void __45__SUInstaller_updateInstallPolicyClientName___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;
  void *v3;
  id v4;

  v1 = *(id **)(a1 + 32);
  v2 = v1[3];
  objc_msgSend(v1, "core");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installPolicyDidChange:", v2);

}

- (BOOL)isInstallerReadyForInstallationWithOptions:(id)a3 error:(id *)a4 ShouldRetry:(BOOL *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  int v29;
  BOOL v30;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v8 = a3;
  -[SUInstaller core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (a5)
    *a5 = 1;
  -[SUInstaller core](self, "core");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "downloadAsset");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_8;
  }
  v13 = (void *)v12;
  -[SUInstaller core](self, "core");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "download");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_8:
    v48 = 0;
    +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v48, 3);
    v19 = v48;
    goto LABEL_9;
  }
  -[SUInstaller core](self, "core");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isScanning");

  if (v17)
  {
    v47 = 0;
    +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v47, 13);
    v18 = v47;
    goto LABEL_15;
  }
  -[SUInstaller core](self, "core");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isDownloading");

  if (!v29)
  {
    if (-[SUInstaller isInstalling](self, "isInstalling"))
    {
      v45 = 0;
      +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v45, 14);
      v19 = v45;
    }
    else if (-[SUInstaller isInstalled](self, "isInstalled"))
    {
      v44 = 0;
      +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v44, 42);
      v19 = v44;
    }
    else
    {
      -[SUInstaller core](self, "core");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "downloadAsset");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "getLocalUrl");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "path");
      v27 = (id)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        SULogInfo(CFSTR("isInstallerReadyForInstallationWithOptions? YES"), v35, v36, v37, v38, v39, v40, v41, v42);
        v30 = 1;
        goto LABEL_19;
      }
      v43 = 0;
      +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v43, 18);
      v19 = v43;
    }
LABEL_9:
    v27 = v19;
    if (a5)
      *a5 = 0;
    if (!a4)
      goto LABEL_18;
    goto LABEL_16;
  }
  v46 = 0;
  +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v46, 11);
  v18 = v46;
LABEL_15:
  v27 = v18;
  if (a4)
  {
LABEL_16:
    if (v27)
    {
      objc_msgSend(v27, "errorWithExtendedUserInfoFromOptions:", v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_18:
  SULogInfo(CFSTR("isInstallerReadyForInstallationWithOptions? NO due to %@"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)v27);
  v30 = 0;
LABEL_19:

  return v30;
}

- (void)getInstallationConstraintsForDownload:(id)a3 allowDiskCleanupIfNeeded:(BOOL)a4 forceDiskCleanupIfNeeded:(BOOL)a5 options:(id)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = dispatch_queue_create("com.apple.softwareupdateservicesd.installationConstraintQueue", 0);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __138__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options_completionQueue_completion___block_invoke;
  v23[3] = &unk_24CE3CD68;
  v23[4] = self;
  v24 = v14;
  v28 = a4;
  v29 = a5;
  v26 = v16;
  v27 = v17;
  v25 = v15;
  v19 = v16;
  v20 = v17;
  v21 = v15;
  v22 = v14;
  dispatch_async(v18, v23);

}

void __138__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options_completionQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  NSObject *v4;
  _QWORD v5[4];
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "getInstallationConstraintsForDownload:allowDiskCleanupIfNeeded:forceDiskCleanupIfNeeded:options:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 48));
  v3 = *(void (***)(_QWORD, _QWORD, _QWORD))(a1 + 64);
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 56);
    if (v4)
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __138__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options_completionQueue_completion___block_invoke_2;
      v5[3] = &unk_24CE3CD40;
      v6 = v3;
      v7 = v2;
      dispatch_async(v4, v5);

    }
    else
    {
      v3[2](v3, v2, 0);
    }
  }
}

uint64_t __138__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

- (unint64_t)getInstallationConstraintsForDownload:(id)a3 allowDiskCleanupIfNeeded:(BOOL)a4 forceDiskCleanupIfNeeded:(BOOL)a5 options:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  SUInstallationConstraintObserver *v12;
  uint64_t v13;
  unint64_t v14;
  SUInstaller *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v49;
  void *v50;
  _QWORD v51[5];
  id v52;
  id v53;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = -[SUInstallationConstraintObserver initWithDownload:andInstallOptions:]([SUInstallationConstraintObserver alloc], "initWithDownload:andInstallOptions:", v10, v11);
  v13 = -[SUComposedInstallationConstraintMonitor unsatisfiedConstraintsWithIgnorableConstraints:](v12, "unsatisfiedConstraintsWithIgnorableConstraints:", objc_msgSend(v11, "ignorableConstraints"));
  v14 = v13;
  if (!v8 || (v13 & 4) == 0)
    goto LABEL_12;
  v50 = v11;
  v15 = self;
  -[SUInstallationConstraintObserver monitorOfClass:](v12, "monitorOfClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "deltaSpaceNeeded");
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v19 = v18;
  v20 = *(double *)&getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options____LAST_REQUEST_TIME;
  v21 = getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options____LAST_DESCRIPTOR;
  objc_msgSend(v10, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_msgSend((id)v21, "isEqual:", v22);

  if ((v21 & 1) == 0)
  {
    objc_msgSend(v10, "descriptor");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options____LAST_DESCRIPTOR;
    getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options____LAST_DESCRIPTOR = v30;

LABEL_8:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v17);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Insufficient disk space detected for installation - attempting to free: %@ bytes"), v33, v34, v35, v36, v37, v38, v39, (uint64_t)v32);

    objc_msgSend(v10, "downloadOptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "installationSize");
    -[SUInstaller core](v15, "core");
    v43 = v16;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "workQueue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUInstaller purgeOptionsForDownloadOptions:spaceNeeded:completionQueue:](SUInstaller, "purgeOptionsForDownloadOptions:spaceNeeded:completionQueue:", v40, v42, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v43;
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke;
    v51[3] = &unk_24CE3CD90;
    v51[4] = v15;
    v52 = v10;
    v11 = v50;
    v53 = v50;
    +[SUSpace makeRoomForUpdate:completion:](SUSpace, "makeRoomForUpdate:completion:", v46, v51);
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options____LAST_REQUEST_TIME = v47;

    goto LABEL_9;
  }
  if (a5 || vabdd_f64(v19, v20) > 10.0)
    goto LABEL_8;
  SULogInfo(CFSTR("Insufficient disk space detected for installation but ignoring attempt to free space because we're within buffer from a prior attempt to do so."), v23, v24, v25, v26, v27, v28, v29, v49);
  v11 = v50;
LABEL_9:
  objc_msgSend(v16, "refreshConstraints");
  if (!objc_msgSend(v16, "deltaSpaceNeeded"))
    v14 &= ~4uLL;

LABEL_12:
  -[SUInstallationConstraintObserver invalidate](v12, "invalidate");

  return v14;
}

void __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD block[5];
  id v22;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke_2;
    block[3] = &unk_24CE3B610;
    v8 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v22 = v8;
    dispatch_async(v7, block);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 48), "automaticInstallation"))
    {
      objc_msgSend(*(id *)(a1 + 32), "core");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke_3;
      v19[3] = &unk_24CE3B610;
      v18 = *(void **)(a1 + 40);
      v19[4] = *(_QWORD *)(a1 + 32);
      v20 = v18;
      dispatch_async(v17, v19);

    }
    SULogInfo(CFSTR("Failed to make room for install: %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v5);
  }

}

void __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissInsufficientDiskSpaceFollowupForUpdate:orForce:", v2, 0);

}

void __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInstalled") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isInstalling") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "descriptor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showInsufficientDiskSpaceFollowupForUpdate:", v2);

  }
}

- (BOOL)isUpdateReadyForInstallation:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  SULogDebug(CFSTR("%s is called"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"-[SUInstaller isUpdateReadyForInstallation:]");
  return -[SUInstaller _isUpdateReadyForInstallationWithOptions:error:shouldRetry:](self, "_isUpdateReadyForInstallationWithOptions:error:shouldRetry:", 0, a3, 0);
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 replyHandler:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v14 = a3;
  SULogDebug(CFSTR("%s is called with options = %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUInstaller isUpdateReadyForInstallationWithOptions:replyHandler:]");
  -[SUInstaller _isUpdateReadyForInstallationWithOptions:forceCleanup:withReplyHandler:](self, "_isUpdateReadyForInstallationWithOptions:forceCleanup:withReplyHandler:", v14, 0, v6);

}

- (BOOL)_isUpdateReadyForInstallationWithOptions:(id)a3 error:(id *)a4 shouldRetry:(BOOL *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  BOOL v11;

  v8 = a3;
  -[SUInstaller core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (-[SUInstaller isInstallerReadyForInstallationWithOptions:error:ShouldRetry:](self, "isInstallerReadyForInstallationWithOptions:error:ShouldRetry:", v8, a4, a5))
  {
    v11 = -[SUInstaller verifyConstraintsMetForInstallationWithOptions:error:](self, "verifyConstraintsMetForInstallationWithOptions:error:", v8, a4);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_isUpdateReadyForInstallationWithOptions:(id)a3 forceCleanup:(BOOL)a4 withReplyHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unsigned __int8 v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[SUInstaller core](self, "core");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v11);

  v21 = 0;
  v20 = 0;
  LOBYTE(v11) = -[SUInstaller isInstallerReadyForInstallationWithOptions:error:ShouldRetry:](self, "isInstallerReadyForInstallationWithOptions:error:ShouldRetry:", v8, &v20, &v21);
  v12 = v20;
  if ((v11 & 1) != 0)
  {
    -[SUInstaller core](self, "core");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "download");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUInstaller core](self, "core");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __86__SUInstaller__isUpdateReadyForInstallationWithOptions_forceCleanup_withReplyHandler___block_invoke;
    v17[3] = &unk_24CE3CDB8;
    v17[4] = self;
    v18 = v8;
    v19 = v9;
    -[SUInstaller getInstallationConstraintsForDownload:allowDiskCleanupIfNeeded:forceDiskCleanupIfNeeded:options:completionQueue:completion:](self, "getInstallationConstraintsForDownload:allowDiskCleanupIfNeeded:forceDiskCleanupIfNeeded:options:completionQueue:completion:", v14, 1, v6, v18, v16, v17);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v9 + 2))(v9, 0, v21, v12);
  }

}

void __86__SUInstaller__isUpdateReadyForInstallationWithOptions_forceCleanup_withReplyHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  unsigned __int8 v8;

  v8 = 0;
  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "_isUpdateReadyForInstallationWithOptions:error:shouldRetry:", v3, &v7, &v8);
  v5 = v7;
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v6 + 16))(v6, v4, v8, v5);

}

- (BOOL)verifyConstraintsMetForInstallationWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;

  v6 = a3;
  -[SUInstaller core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUInstaller core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "download");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUInstaller getInstallationConstraintsForDownload:allowDiskCleanupIfNeeded:forceDiskCleanupIfNeeded:options:](self, "getInstallationConstraintsForDownload:allowDiskCleanupIfNeeded:forceDiskCleanupIfNeeded:options:", v10, 0, 0, v6);

  if (v11)
  {
    v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("SUInstallationConstraintsUnmet"));

    v21 = (void *)MEMORY[0x24BDD16E0];
    -[SUInstaller installPolicy](self, "installPolicy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "clientName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithBool:", objc_msgSend(v23, "isEqualToString:", CFSTR("dmd")));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v24, CFSTR("SUMDMInstallationRequest"));

    SUStringFromInstallationConstraints(v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSafeObject:forKey:", v25, *MEMORY[0x24BDD0BA0]);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 20, v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUInstaller core](self, "core");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "reportPostponedEvent:withStatus:withAdditionalMetrics:", v26, CFSTR("installNotReady"), v19);

    SUStringFromInstallationConstraints(v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Is ready for installation?  No due to constraints unmet: %@"), v29, v30, v31, v32, v33, v34, v35, (uint64_t)v28);

    if (a4)
      *a4 = objc_retainAutorelease(v26);
    -[SUInstaller core](self, "core");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "state");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "description");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setDdmPersistedErrorDescription:", v38);

    notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8B8], "UTF8String"));
  }
  else
  {
    SULogInfo(CFSTR("Is ready for installation?  YES"), v12, v13, v14, v15, v16, v17, v18, v40);
  }
  return v11 == 0;
}

- (void)installCompleted:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  int v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  SUInvalidatable *installDeviceLockAssertion;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void **v53;
  const __CFString **v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  uint64_t v81;
  SUInstaller *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  id v101;
  void *v102;
  void *v103;
  char v104;
  void *v105;
  NSObject *v106;
  SUInstallOptions *currentInstallOptions;
  void *v108;
  uint64_t v109;
  int v110;
  _QWORD v111[5];
  id v112;
  id v113;
  _QWORD v114[5];
  id v115;
  _QWORD v116[5];
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD block[4];
  id v123;
  SUInstaller *v124;
  id v125;
  const __CFString *v126;
  void *v127;
  _QWORD v128[2];
  _QWORD v129[2];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8C0], "UTF8String"));
  -[SUInstaller core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = (_QWORD *)MEMORY[0x24BE67280];
  if (v4)
  {
    objc_msgSend(v4, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDdmPersistedErrorDescription:", v11);

    notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8B8], "UTF8String"));
    if (!-[SUInstaller isInstallRetrying](self, "isInstallRetrying"))
    {
      objc_msgSend(v4, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqualToString:", *v10) & 1) != 0)
      {
        v20 = objc_msgSend(v4, "code");

        if (v20 == 20)
        {
          -[SUInstaller core](self, "core");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "download");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[SUInstaller setInstallRetrying:](self, "setInstallRetrying:", 1);
          +[SUUtility taskQueue](SUUtility, "taskQueue");
          v23 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __32__SUInstaller_installCompleted___block_invoke;
          block[3] = &unk_24CE3BB38;
          v123 = v22;
          v124 = self;
          v24 = v4;
          v125 = v24;
          v25 = v22;
          dispatch_async(v23, block);

LABEL_46:
          goto LABEL_47;
        }
      }
      else
      {

      }
    }
    SULogInfo(CFSTR("Installation error: %@"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)v4);
    objc_msgSend(v4, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors"));

    if (v28 && (objc_msgSend(v4, "code") == 78 || objc_msgSend(v4, "code") == 64))
    {
      SULogInfo(CFSTR("Installation error is fatal, clean update"), v29, v30, v31, v32, v33, v34, v35, v109);
      v26 = 1;
    }
    else
    {
      v26 = 0;
    }
    +[SUUtility errorRemovingUserInfoKey:originalError:](SUUtility, "errorRemovingUserInfoKey:originalError:", CFSTR("InstallOptions"), v4);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if ((v26 & 1) == 0)
    {
      -[SUInstaller core](self, "core");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "reportPostponedEvent:withStatus:", v24, *MEMORY[0x24BEAEAB0]);

    }
    objc_msgSend(v24, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *v10))
    {
      v37 = objc_msgSend(v24, "code");

      if (v37 != 26)
        goto LABEL_19;
      -[SUInstaller core](self, "core");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLastStashbagPersistedDate:", 0);
    }
  }
  else
  {
    objc_msgSend(v8, "setDdmPersistedError:", 0);

    v26 = 0;
    v24 = 0;
  }

LABEL_19:
  -[SUInstaller setInstallRetrying:](self, "setInstallRetrying:", 0);
  if (self->_installDeviceLockAssertion)
  {
    SULogInfo(CFSTR("releasing lock assertion"), v38, v39, v40, v41, v42, v43, v44, v109);
    -[SUInvalidatable invalidate](self->_installDeviceLockAssertion, "invalidate");
    installDeviceLockAssertion = self->_installDeviceLockAssertion;
    self->_installDeviceLockAssertion = 0;

  }
  if (v24)
  {
    objc_msgSend(v24, "domain");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "isEqualToString:", *v10))
    {
      v47 = objc_msgSend(v24, "code");

      if (v47 != 26)
      {
LABEL_26:
        -[SUInstaller installPolicy](self, "installPolicy");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "clientName");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("dmd"));

        if (v50)
        {
          v129[0] = MEMORY[0x24BDBD1C8];
          v128[0] = CFSTR("SUMDMInstallationRequest");
          v128[1] = CFSTR("SUAutomaticInstallation");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUInstallOptions automaticInstallation](self->_currentInstallOptions, "automaticInstallation"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v129[1] = v51;
          v52 = (void *)MEMORY[0x24BDBCE70];
          v53 = (void **)v129;
          v54 = (const __CFString **)v128;
          v55 = 2;
        }
        else
        {
          v126 = CFSTR("SUAutomaticInstallation");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUInstallOptions automaticInstallation](self->_currentInstallOptions, "automaticInstallation"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v127 = v51;
          v52 = (void *)MEMORY[0x24BDBCE70];
          v53 = &v127;
          v54 = &v126;
          v55 = 1;
        }
        objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v53, v54, v55);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUtility translateError:withAddedUserInfo:](SUUtility, "translateError:withAddedUserInfo:", v24, v85);
        v73 = (id)objc_claimAutoreleasedReturnValue();

        SULogInfo(CFSTR("Installation failed with error: %@"), v86, v87, v88, v89, v90, v91, v92, (uint64_t)v73);
        -[SUInstaller core](self, "core");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "delegate");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_opt_respondsToSelector();

        if ((v95 & 1) != 0)
        {
          -[SUInstaller core](self, "core");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "download");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "descriptor");
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          -[SUInstaller core](self, "core");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "externWorkQueue");
          v100 = objc_claimAutoreleasedReturnValue();
          v111[0] = MEMORY[0x24BDAC760];
          v111[1] = 3221225472;
          v111[2] = __32__SUInstaller_installCompleted___block_invoke_3_254;
          v111[3] = &unk_24CE3BB38;
          v111[4] = self;
          v112 = v98;
          v73 = v73;
          v113 = v73;
          v101 = v98;
          dispatch_async(v100, v111);

        }
        goto LABEL_44;
      }
      -[SUInstaller core](self, "core");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "clearKeybagStash");
    }

    goto LABEL_26;
  }
  v110 = v26;
  self->_installed = 1;
  -[SUInstaller core](self, "core");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "state");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setAppliedTime:", v58);

  -[SUInstaller core](self, "core");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "state");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "save");

  +[SUAlertPresentationManager sharedInstance](SUAlertPresentationManager, "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "dismissAlertsOfClass:animated:", objc_opt_class(), 1);

  -[SUInstaller core](self, "core");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "reportOTAInstalledEvent");

  SULogInfo(CFSTR("Clearing badge after successful install"), v63, v64, v65, v66, v67, v68, v69, v109);
  -[SUInstaller core](self, "core");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "clearBadgeAndBanner");

  -[SUInstaller core](self, "core");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "download");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "descriptor");
  v73 = (id)objc_claimAutoreleasedReturnValue();

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  -[SUInstaller core](self, "core");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "observers");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "allObjects");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v78; ++i)
      {
        if (*(_QWORD *)v119 != v79)
          objc_enumerationMutation(v76);
        v81 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SUInstaller core](self, "core");
          v82 = self;
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "externWorkQueue");
          v84 = objc_claimAutoreleasedReturnValue();
          v116[0] = MEMORY[0x24BDAC760];
          v116[1] = 3221225472;
          v116[2] = __32__SUInstaller_installCompleted___block_invoke_248;
          v116[3] = &unk_24CE3B610;
          v116[4] = v81;
          v117 = v73;
          dispatch_async(v84, v116);

          self = v82;
        }
      }
      v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
    }
    while (v78);
  }

  -[SUInstaller core](self, "core");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "delegate");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_opt_respondsToSelector();

  if ((v104 & 1) != 0)
  {
    -[SUInstaller core](self, "core");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "externWorkQueue");
    v106 = objc_claimAutoreleasedReturnValue();
    v114[0] = MEMORY[0x24BDAC760];
    v114[1] = 3221225472;
    v114[2] = __32__SUInstaller_installCompleted___block_invoke_2_249;
    v114[3] = &unk_24CE3B610;
    v114[4] = self;
    v73 = v73;
    v115 = v73;
    dispatch_async(v106, v114);

  }
  v24 = 0;
  v26 = v110;
LABEL_44:

  +[SUUtility setCacheable:](SUUtility, "setCacheable:", 1);
  currentInstallOptions = self->_currentInstallOptions;
  self->_currentInstallOptions = 0;

  -[SUInstaller setInstalling:](self, "setInstalling:", 0);
  if (v26)
  {
    -[SUInstaller core](self, "core");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "clearKeybagStash");

    -[SUInstaller core](self, "core");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cleanupPreviousDownloadState");
    goto LABEL_46;
  }
LABEL_47:

}

void __32__SUInstaller_installCompleted___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  id v11;
  int8x16_t v12;

  objc_msgSend(a1[4], "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "installationSize") + 10485760;

  objc_msgSend(a1[4], "downloadOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUInstaller purgeOptionsForDownloadOptions:spaceNeeded:completionQueue:](SUInstaller, "purgeOptionsForDownloadOptions:spaceNeeded:completionQueue:", v4, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __32__SUInstaller_installCompleted___block_invoke_2;
  v10[3] = &unk_24CE3CD90;
  v11 = a1[6];
  v9 = *((int8x16_t *)a1 + 2);
  v8 = (id)v9.i64[0];
  v12 = vextq_s8(v9, v9, 8uLL);
  +[SUSpace makeRoomForUpdate:completion:](SUSpace, "makeRoomForUpdate:completion:", v7, v10);

}

void __32__SUInstaller_installCompleted___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[5];
  id v39;
  _QWORD block[5];
  id v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("InstallOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    SULogInfo(CFSTR("Cleaned up sufficient space to retry install"), v8, v9, v10, v11, v12, v13, v14, v37);
    objc_msgSend(*(id *)(a1 + 40), "core");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__SUInstaller_installCompleted___block_invoke_3;
    block[3] = &unk_24CE3B610;
    v17 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v41 = v17;
    dispatch_async(v16, block);

    objc_msgSend(*(id *)(a1 + 40), "core");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setManaged:", objc_msgSend(v18, "isManaged"));

    objc_msgSend(*(id *)(a1 + 40), "core");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "engine");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "installUpdate:", v7);

  }
  else
  {
    if (objc_msgSend(v7, "automaticInstallation"))
    {
      objc_msgSend(*(id *)(a1 + 40), "core");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "workQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __32__SUInstaller_installCompleted___block_invoke_4;
      v38[3] = &unk_24CE3B610;
      v23 = *(void **)(a1 + 48);
      v38[4] = *(_QWORD *)(a1 + 40);
      v39 = v23;
      dispatch_async(v22, v38);

    }
    v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_24CE6E0B8, CFSTR("SUInstallationConstraintsUnmet"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 20, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "core");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = &unk_24CE6E0B8;
    v27 = *MEMORY[0x24BDD0BA0];
    v42[0] = CFSTR("SUInstallationConstraintsUnmet");
    v42[1] = v27;
    SUStringFromInstallationConstraints(4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "reportPostponedEvent:withStatus:withAdditionalMetrics:", v25, CFSTR("installNotReady"), v29);

    SULogInfo(CFSTR("Failed to Clean up sufficient space to retry install: %@"), v30, v31, v32, v33, v34, v35, v36, (uint64_t)v25);
    objc_msgSend(*(id *)(a1 + 40), "installCompleted:", v25);

  }
}

void __32__SUInstaller_installCompleted___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissInsufficientDiskSpaceFollowupForUpdate:orForce:", v2, 0);

}

void __32__SUInstaller_installCompleted___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInstalled") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isInstalling") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "descriptor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showInsufficientDiskSpaceFollowupForUpdate:", v2);

  }
}

uint64_t __32__SUInstaller_installCompleted___block_invoke_248(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "installDidFinish:", *(_QWORD *)(a1 + 40));
}

void __32__SUInstaller_installCompleted___block_invoke_2_249(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installDidFinish:", *(_QWORD *)(a1 + 40));

}

void __32__SUInstaller_installCompleted___block_invoke_3_254(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installDidFail:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;

  v6 = a3;
  v7 = a4;
  -[SUInstaller core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8C0], "UTF8String"));
  if (v6
    || (v6 = (id)objc_opt_new(),
        SULogInfo(CFSTR("No installOptions provided, using the default value"), v10, v11, v12, v13, v14, v15, v16, v28),
        v6))
  {
    -[SUInstaller updateInstallPolicyType:](self, "updateInstallPolicyType:", objc_msgSend(v6, "isRequired"));
    -[SUInstaller updateInstallPolicyDarkBootEnabled:](self, "updateInstallPolicyDarkBootEnabled:", objc_msgSend(v6, "isDarkBoot"));
    objc_msgSend(v6, "clientName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUInstaller updateInstallPolicyClientName:](self, "updateInstallPolicyClientName:", v17);

    -[SUInstaller core](self, "core");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setManaged:", objc_msgSend(v18, "isManaged"));

  }
  -[SUInstaller installPolicy](self, "installPolicy");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Starting SU Installation with install options: %@; policy: %@"),
    v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v25,
    (uint64_t)v6);

  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke;
  v30[3] = &unk_24CE3CDE0;
  v30[4] = self;
  v31 = v6;
  v32 = v7;
  v26 = v7;
  v27 = v6;
  -[SUInstaller _isUpdateReadyForInstallationWithOptions:forceCleanup:withReplyHandler:](self, "_isUpdateReadyForInstallationWithOptions:forceCleanup:withReplyHandler:", v27, 1, v30);

}

void __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke(id *a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  id v46;
  void (**v47)(void);
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  id v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[5];
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD block[5];
  _QWORD v79[4];
  id v80;
  id v81;
  _QWORD v82[5];
  id v83;
  id v84;
  id v85;
  const __CFString *v86;
  _QWORD v87[2];

  v87[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a1[4], "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if ((a2 & 1) != 0)
  {
    objc_msgSend(a1[4], "ensureSSOTokenIfNeeded:", a1[5]);
    SULogInfo(CFSTR("Ready to install!"), v16, v17, v18, v19, v20, v21, v22, v71);
    +[SUUtility setCacheable:](SUUtility, "setCacheable:", 0);
    objc_msgSend(a1[4], "setInstalling:", 1);
    objc_storeStrong((id *)a1[4] + 6, a1[5]);
    +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isPasscodeLocked");

    if ((v24 & 1) == 0)
    {
      +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "createPreventLockAssertionWithDuration:", 600.0);
      v27 = a1[4];
      v28 = (void *)v27[5];
      v27[5] = v26;

    }
    objc_msgSend(a1[4], "core");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "download");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "descriptor");
    v31 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v31, "isSplatOnly"))
    {
      objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "hasSemiSplatActive");

      if (v33)
      {
        SULogInfo(CFSTR("Trying to install a Splat but an already-installed Splat was detected, rebooting..."), v34, v35, v36, v37, v38, v39, v40, v72);
        objc_msgSend(a1[4], "core");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "workQueue");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = MEMORY[0x24BDAC760];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_4;
        block[3] = &unk_24CE3B5C0;
        block[4] = a1[4];
        dispatch_async(v42, block);

        if (a1[6])
        {
          objc_msgSend(a1[4], "core");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "externWorkQueue");
          v45 = objc_claimAutoreleasedReturnValue();
          v76[0] = v43;
          v76[1] = 3221225472;
          v76[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_5;
          v76[3] = &unk_24CE3C470;
          v77 = a1[6];
          dispatch_async(v45, v76);

        }
      }
    }
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_6;
    v73[3] = &unk_24CE3B6B0;
    v46 = a1[5];
    v73[4] = a1[4];
    v74 = v46;
    v75 = a1[6];
    v47 = (void (**)(void))MEMORY[0x212BF6094](v73);
    v47[2]();

    v48 = v74;
    goto LABEL_13;
  }
  SULogInfo(CFSTR("Installation error: download not ready for installation: %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v6);
  objc_msgSend(a1[4], "core");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "reportPostponedEvent:withStatus:", v6, *MEMORY[0x24BEAEAD0]);

  v85 = 0;
  +[SUUtility assignError:withError:translate:](SUUtility, "assignError:withError:translate:", &v85, v6, 0);
  v50 = v85;
  v86 = CFSTR("SUAutomaticInstallation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1[5], "automaticInstallation"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v51;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
  v52 = objc_claimAutoreleasedReturnValue();
  +[SUUtility updateError:withAdditionalUserInfo:](SUUtility, "updateError:withAdditionalUserInfo:", v50, v52);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  SULogDebug(CFSTR("%s: outError = %@"), v53, v54, v55, v56, v57, v58, v59, (uint64_t)"-[SUInstaller installUpdateWithInstallOptions:withResult:]_block_invoke");
  objc_msgSend(a1[4], "core");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "delegate");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v52) = objc_opt_respondsToSelector();

  v62 = MEMORY[0x24BDAC760];
  if ((v52 & 1) != 0)
  {
    objc_msgSend(a1[4], "core");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "download");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "descriptor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "core");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "externWorkQueue");
    v67 = objc_claimAutoreleasedReturnValue();
    v82[0] = v62;
    v82[1] = 3221225472;
    v82[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_2;
    v82[3] = &unk_24CE3BB38;
    v82[4] = a1[4];
    v83 = v65;
    v84 = v31;
    v68 = v65;
    dispatch_async(v67, v82);

  }
  if (a1[6])
  {
    objc_msgSend(a1[4], "core");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "externWorkQueue");
    v70 = objc_claimAutoreleasedReturnValue();
    v79[0] = v62;
    v79[1] = 3221225472;
    v79[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_3;
    v79[3] = &unk_24CE3BD58;
    v81 = a1[6];
    v31 = v31;
    v80 = v31;
    dispatch_async(v70, v79);

    v48 = v81;
LABEL_13:

  }
}

void __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installDidFail:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "installCompleted:", 0);
}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  dispatch_time_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  dispatch_time_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46[4];
  id v47;
  _QWORD v48[5];
  _QWORD v49[5];
  id v50;
  _QWORD block[5];
  id v52;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "download");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "core");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "externWorkQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_7;
    block[3] = &unk_24CE3B610;
    block[4] = *(_QWORD *)(a1 + 32);
    v52 = v8;
    v11 = v8;
    dispatch_async(v10, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "core");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reporterFlushEvent");

  objc_msgSend(*(id *)(a1 + 32), "core");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "engine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "core");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "newInstallTonightConfig");
  objc_msgSend(v14, "refreshInstallTonightConfig:", v16);

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v17, "fakeInstallFailure");

  if (!(_DWORD)v14)
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "skipDownload"))
    {

    }
    else
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "skipApply");

      if (!v39)
      {
        objc_msgSend(*(id *)(a1 + 32), "core");
        v29 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "engine");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "installUpdate:", *(_QWORD *)(a1 + 40));

        goto LABEL_10;
      }
    }
    SULogInfo(CFSTR("SUSkipDownload or SUSkipApply is set, skip this apply phase and return YES."), v31, v32, v33, v34, v35, v36, v37, v46[0]);
    v40 = dispatch_time(0, 5000000000);
    objc_msgSend(*(id *)(a1 + 32), "core");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "workQueue");
    v42 = objc_claimAutoreleasedReturnValue();
    v48[0] = v5;
    v48[1] = 3221225472;
    v48[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_9;
    v48[3] = &unk_24CE3B5C0;
    v48[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v40, v42, v48);

    goto LABEL_11;
  }
  SULogInfo(CFSTR("SUFakeInstallFailure is set; faking an installation failure of SUErrorCodeInstallNotAllowable..."),
    v18,
    v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v46[0]);
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 106);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = dispatch_time(0, 5000000000);
  objc_msgSend(*(id *)(a1 + 32), "core");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "workQueue");
  v28 = objc_claimAutoreleasedReturnValue();
  v49[0] = v5;
  v49[1] = 3221225472;
  v49[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_8;
  v49[3] = &unk_24CE3B610;
  v49[4] = *(_QWORD *)(a1 + 32);
  v50 = v25;
  v29 = v25;
  dispatch_after(v26, v28, v49);

LABEL_10:
LABEL_11:
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "externWorkQueue");
    v45 = objc_claimAutoreleasedReturnValue();
    v46[0] = v5;
    v46[1] = 3221225472;
    v46[2] = (uint64_t)__58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_10;
    v46[3] = (uint64_t)&unk_24CE3C470;
    v47 = *(id *)(a1 + 48);
    dispatch_async(v45, v46);

  }
}

void __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_7(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installDidStart:", *(_QWORD *)(a1 + 40));

}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "installCompleted:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "installCompleted:", 0);
}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)managedInstallRequested
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  SUInstallPolicy *v8;
  void *v9;
  NSObject *v10;
  SUInstallPolicy *v11;
  _QWORD v12[5];
  SUInstallPolicy *v13;

  -[SUInstaller core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = self->_installPolicy;
    -[SUInstaller core](self, "core");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "externWorkQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __38__SUInstaller_managedInstallRequested__block_invoke;
    v12[3] = &unk_24CE3B610;
    v12[4] = self;
    v13 = v8;
    v11 = v8;
    dispatch_async(v10, v12);

  }
}

void __38__SUInstaller_managedInstallRequested__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedInstallationRequested:", *(_QWORD *)(a1 + 40));

}

- (void)autoSUFailedWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SUAutoInstallFailureAlertItem *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[SUInstaller core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUInstaller core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "download");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SUInstaller core](self, "core");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "download");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v18 = 0;
      goto LABEL_7;
    }
    -[SUInstaller core](self, "core");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "download");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "descriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "humanReadableUpdateName");
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

LABEL_7:
  +[SUAlertPresentationManager sharedInstance](SUAlertPresentationManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dismissAlertsOfClass:animated:", objc_opt_class(), 1);

  v16 = -[SUAutoInstallFailureAlertItem initWithError:buildNumber:]([SUAutoInstallFailureAlertItem alloc], "initWithError:buildNumber:", v4, v18);
  +[SUAlertPresentationManager sharedInstance](SUAlertPresentationManager, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentAlert:animated:", v16, 1);

}

- (void)ensureSSOTokenIfNeeded:(id)a3
{
  void *v3;
  char v4;
  void *v5;
  const __CFBoolean *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFBoolean *v14;
  CFTypeID v15;
  int Value;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a3;
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "suppressSSOTokenInInstall");

  v5 = v25;
  if ((v4 & 1) == 0)
  {
    v6 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("EnableSso"), CFSTR("com.apple.MobileSoftwareUpdate"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
    if (v6)
    {
      v14 = v6;
      v15 = CFGetTypeID(v6);
      if (v15 == CFBooleanGetTypeID())
      {
        Value = CFBooleanGetValue(v14);
        CFRelease(v14);
        if (Value)
        {
          if (objc_msgSend(v25, "automaticInstallation"))
          {
            SULogInfo(CFSTR("%s: No need for sso token - install is not user-initiated"), v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUInstaller ensureSSOTokenIfNeeded:]");
          }
          else
          {
            +[SUAuthSSO sharedInstance](SUAuthSSO, "sharedInstance");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "invokeSSOAuth");

          }
          goto LABEL_9;
        }
      }
      else
      {
        CFRelease(v14);
      }
    }
    SULogInfo(CFSTR("%s: No need for sso token - not enabled in MSU preferences"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUInstaller ensureSSOTokenIfNeeded:]");
LABEL_9:
    v5 = v25;
  }

}

+ (id)purgeOptionsForDownloadOptions:(id)a3 spaceNeeded:(unint64_t)a4 completionQueue:(id)a5
{
  id v7;
  id v8;
  SUSpacePurgeOptions *v9;
  uint64_t v10;

  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(SUSpacePurgeOptions);
  -[SUSpacePurgeOptions setNeededBytes:](v9, "setNeededBytes:", a4);
  -[SUSpacePurgeOptions setEnableCacheDelete:](v9, "setEnableCacheDelete:", 1);
  if ((objc_msgSend(v7, "isAutoDownload") & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(v7, "isAppOffloadEnabled");
  -[SUSpacePurgeOptions setEnableAppOffload:](v9, "setEnableAppOffload:", v10);
  -[SUSpacePurgeOptions setCacheDeleteUrgency:](v9, "setCacheDeleteUrgency:", 4);
  -[SUSpacePurgeOptions setAppOffloadUrgency:](v9, "setAppOffloadUrgency:", 4);
  -[SUSpacePurgeOptions setCompletionQueue:](v9, "setCompletionQueue:", v8);

  return v9;
}

- (SUManagerCore)core
{
  return (SUManagerCore *)objc_loadWeakRetained((id *)&self->_core);
}

- (void)setCore:(id)a3
{
  objc_storeWeak((id *)&self->_core, a3);
}

- (BOOL)isInstallRetrying
{
  return self->_installRetrying;
}

- (void)setInstallRetrying:(BOOL)a3
{
  self->_installRetrying = a3;
}

- (SUInvalidatable)installDeviceLockAssertion
{
  return self->_installDeviceLockAssertion;
}

- (void)setInstallDeviceLockAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_installDeviceLockAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInstallOptions, 0);
  objc_storeStrong((id *)&self->_installDeviceLockAssertion, 0);
  objc_storeStrong((id *)&self->_passcodePolicy, 0);
  objc_storeStrong((id *)&self->_installPolicy, 0);
  objc_destroyWeak((id *)&self->_core);
}

@end
