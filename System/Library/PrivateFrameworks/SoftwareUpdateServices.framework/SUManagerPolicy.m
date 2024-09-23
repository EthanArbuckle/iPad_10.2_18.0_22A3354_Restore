@implementation SUManagerPolicy

- (SUManagerPolicy)init
{
  SUManagerPolicy *v2;
  SUManagerCore *v3;
  SUManagerCore *core;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUManagerPolicy;
  v2 = -[SUManagerPolicy init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SUManagerCore);
    core = v2->_core;
    v2->_core = v3;

    objc_storeWeak((id *)&v2->_delegate, 0);
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  SUManagerDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  -[SUManagerPolicy core](self, "core");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    -[SUManagerPolicy core](self, "core");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __31__SUManagerPolicy_addObserver___block_invoke;
    v7[3] = &unk_24CE3B610;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

void __31__SUManagerPolicy_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    -[SUManagerPolicy core](self, "core");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __34__SUManagerPolicy_removeObserver___block_invoke;
    v7[3] = &unk_24CE3B610;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

void __34__SUManagerPolicy_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (BOOL)isScanning
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__SUManagerPolicy_isScanning__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __29__SUManagerPolicy_isScanning__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isScanning");

}

- (BOOL)isDownloading
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __32__SUManagerPolicy_isDownloading__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __32__SUManagerPolicy_isDownloading__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isDownloading");

}

- (BOOL)isDownloaded
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__SUManagerPolicy_isDownloaded__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __31__SUManagerPolicy_isDownloaded__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isUpdateDownloaded");

}

- (BOOL)isInstalling
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__SUManagerPolicy_isInstalling__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __31__SUManagerPolicy_isInstalling__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isInstalling");

}

- (BOOL)isForeground
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__SUManagerPolicy_isForeground__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __31__SUManagerPolicy_isForeground__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isForeground");

}

- (void)setForeground:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SUManagerPolicy_setForeground___block_invoke;
  v7[3] = &unk_24CE3BB60;
  v7[4] = self;
  v8 = a3;
  dispatch_async(v6, v7);

}

void __33__SUManagerPolicy_setForeground___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setForeground:", *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)isClearingSpace
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__SUManagerPolicy_isClearingSpace__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __34__SUManagerPolicy_isClearingSpace__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isClearingSpace");

}

- (BOOL)isInstallTonight
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__SUManagerPolicy_isInstallTonight__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __35__SUManagerPolicy_isInstallTonight__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isInstallTonight");

}

- (void)setIsInstallTonight:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SUManagerPolicy_setIsInstallTonight___block_invoke;
  v7[3] = &unk_24CE3BB60;
  v7[4] = self;
  v8 = a3;
  dispatch_async(v6, v7);

}

void __39__SUManagerPolicy_setIsInstallTonight___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsInstallTonight:", *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)isInstallTonightScheduled
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__SUManagerPolicy_isInstallTonightScheduled__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __44__SUManagerPolicy_isInstallTonightScheduled__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isInstallTonightScheduled");

}

- (void)setIsInstallTonightScheduled:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SUManagerPolicy_setIsInstallTonightScheduled___block_invoke;
  v7[3] = &unk_24CE3BB60;
  v7[4] = self;
  v8 = a3;
  dispatch_async(v6, v7);

}

void __48__SUManagerPolicy_setIsInstallTonightScheduled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsInstallTonightScheduled:", *(unsigned __int8 *)(a1 + 40));

}

- (SUAutoUpdatePasscodePolicy)passcodePolicy
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__SUManagerPolicy_passcodePolicy__block_invoke;
  v9[3] = &unk_24CE3B5E8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (SUAutoUpdatePasscodePolicy *)v7;
}

void __33__SUManagerPolicy_passcodePolicy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodePolicy");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPasscodePolicy:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__SUManagerPolicy_setPasscodePolicy___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __37__SUManagerPolicy_setPasscodePolicy___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPasscodePolicy:", *(_QWORD *)(a1 + 40));

}

- (void)resumeOrResetIfNecessary
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagerPolicy_resumeOrResetIfNecessary__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(v6, block);

}

void __43__SUManagerPolicy_resumeOrResetIfNecessary__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resumeOrResetIfNecessary");

}

- (void)autoScanAndDownloadIfAvailable:(int)a3
{
  -[SUManagerPolicy autoScanAndDownloadIfAvailable:withResult:](self, "autoScanAndDownloadIfAvailable:withResult:", *(_QWORD *)&a3, 0);
}

- (void)autoScanAndDownloadIfAvailable:(int)a3 withResult:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  int v12;

  v6 = a4;
  -[SUManagerPolicy core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SUManagerPolicy_autoScanAndDownloadIfAvailable_withResult___block_invoke;
  block[3] = &unk_24CE3D8B0;
  v12 = a3;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

}

void __61__SUManagerPolicy_autoScanAndDownloadIfAvailable_withResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoScanAndDownloadIfAvailable:withResult:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)autoScanAndDownloadIfAvailable:(int)a3 downloadNow:(BOOL)a4 withResult:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  int v14;
  BOOL v15;

  v8 = a5;
  -[SUManagerPolicy core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__SUManagerPolicy_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke;
  block[3] = &unk_24CE3D8D8;
  v14 = a3;
  v15 = a4;
  block[4] = self;
  v13 = v8;
  v11 = v8;
  dispatch_async(v10, block);

}

void __73__SUManagerPolicy_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoScanAndDownloadIfAvailable:downloadNow:withResult:", *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 52), *(_QWORD *)(a1 + 40));

}

- (void)loadBrainOnUnlock
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SUManagerPolicy_loadBrainOnUnlock__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __36__SUManagerPolicy_loadBrainOnUnlock__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadBrainOnUnlock");

}

- (void)tryAutodownload
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SUManagerPolicy_tryAutodownload__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __34__SUManagerPolicy_tryAutodownload__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tryAutodownload");

}

- (void)noteAutodownloadFailedToStartWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__SUManagerPolicy_noteAutodownloadFailedToStartWithError___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __58__SUManagerPolicy_noteAutodownloadFailedToStartWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteAutodownloadFailedToStartWithError:", *(_QWORD *)(a1 + 40));

}

- (void)endAutodownloadTasksAndResetState
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SUManagerPolicy_endAutodownloadTasksAndResetState__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __52__SUManagerPolicy_endAutodownloadTasksAndResetState__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endAutodownloadTasksAndResetState");

}

- (id)preferredLastScannedDescriptor
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__SUManagerPolicy_preferredLastScannedDescriptor__block_invoke;
  v9[3] = &unk_24CE3B5E8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__SUManagerPolicy_preferredLastScannedDescriptor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLastScannedDescriptor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)alternateLastScannedDescriptor
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__SUManagerPolicy_alternateLastScannedDescriptor__block_invoke;
  v9[3] = &unk_24CE3B5E8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__SUManagerPolicy_alternateLastScannedDescriptor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alternateLastScannedDescriptor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)presentAutoUpdateBanner:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__SUManagerPolicy_presentAutoUpdateBanner___block_invoke;
  v8[3] = &unk_24CE3B688;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __43__SUManagerPolicy_presentAutoUpdateBanner___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentAutoUpdateBanner:", *(_QWORD *)(a1 + 40));

}

- (void)dismissAutoUpdateBanner
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUManagerPolicy_dismissAutoUpdateBanner__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __42__SUManagerPolicy_dismissAutoUpdateBanner__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissAutoUpdateBanner");

}

- (void)unbadgeSettingsForManualSoftwareUpdate
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SUManagerPolicy_unbadgeSettingsForManualSoftwareUpdate__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __57__SUManagerPolicy_unbadgeSettingsForManualSoftwareUpdate__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unbadgeSettingsForManualSoftwareUpdate");

}

- (void)badgeSettingsForManualSoftwareUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__SUManagerPolicy_badgeSettingsForManualSoftwareUpdate___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __56__SUManagerPolicy_badgeSettingsForManualSoftwareUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badgeSettingsForManualSoftwareUpdate:", *(_QWORD *)(a1 + 40));

}

- (void)scanForUpdates:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagerPolicy_scanForUpdates_complete___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __43__SUManagerPolicy_scanForUpdates_complete___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scanForUpdates:complete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)scanForUpdates:(id)a3 shouldUseDDMInState:(BOOL)a4 complete:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  -[SUManagerPolicy core](self, "core");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__SUManagerPolicy_scanForUpdates_shouldUseDDMInState_complete___block_invoke;
  v14[3] = &unk_24CE3C208;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

void __63__SUManagerPolicy_scanForUpdates_shouldUseDDMInState_complete___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scanForUpdates:shouldUseDDMInState:complete:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  SUManagerPolicy *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUManagerPolicy_cancelDownloadWithOptions_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __56__SUManagerPolicy_cancelDownloadWithOptions_withResult___block_invoke(id *a1)
{
  SUPurgeOptions *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;
  id v12;

  v2 = (SUPurgeOptions *)a1[4];
  if (!v2)
  {
    v2 = objc_alloc_init(SUPurgeOptions);
    -[SUPurgeOptions setNotifyUser:](v2, "setNotifyUser:", 1);
    -[SUPurgeOptions setUserRequested:](v2, "setUserRequested:", 1);
  }
  objc_msgSend(a1[5], "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v4 = objc_msgSend(v3, "cancelDownload:userRequested:keepDocAssets:error:", -[SUPurgeOptions notifyUser](v2, "notifyUser"), -[SUPurgeOptions userRequested](v2, "userRequested"), 0, &v12);
  v5 = v12;

  if (a1[6])
  {
    objc_msgSend(a1[5], "core");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externWorkQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__SUManagerPolicy_cancelDownloadWithOptions_withResult___block_invoke_2;
    v8[3] = &unk_24CE3BC40;
    v10 = a1[6];
    v11 = v4;
    v9 = v5;
    dispatch_async(v7, v8);

  }
}

uint64_t __56__SUManagerPolicy_cancelDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  SUManagerPolicy *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUManagerPolicy_purgeDownloadWithOptions_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __55__SUManagerPolicy_purgeDownloadWithOptions_withResult___block_invoke(id *a1)
{
  SUPurgeOptions *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;
  id v12;

  v2 = (SUPurgeOptions *)a1[4];
  if (!v2)
  {
    v2 = objc_alloc_init(SUPurgeOptions);
    -[SUPurgeOptions setNotifyUser:](v2, "setNotifyUser:", 1);
    -[SUPurgeOptions setUserRequested:](v2, "setUserRequested:", 1);
  }
  objc_msgSend(a1[5], "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v4 = objc_msgSend(v3, "killDownload:userRequested:keepDocAssets:error:", -[SUPurgeOptions notifyUser](v2, "notifyUser"), -[SUPurgeOptions userRequested](v2, "userRequested"), 0, &v12);
  v5 = v12;

  if (a1[6])
  {
    objc_msgSend(a1[5], "core");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externWorkQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__SUManagerPolicy_purgeDownloadWithOptions_withResult___block_invoke_2;
    v8[3] = &unk_24CE3BC40;
    v10 = a1[6];
    v11 = v4;
    v9 = v5;
    dispatch_async(v7, v8);

  }
}

uint64_t __55__SUManagerPolicy_purgeDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)pauseDownload:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = 0;
  +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v11, 60);
  v5 = v11;
  if (v4)
  {
    -[SUManagerPolicy core](self, "core");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externWorkQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__SUManagerPolicy_pauseDownload___block_invoke;
    block[3] = &unk_24CE3BD58;
    v10 = v4;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __33__SUManagerPolicy_pauseDownload___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)resumeDownload:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = 0;
  +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v11, 60);
  v5 = v11;
  if (v4)
  {
    -[SUManagerPolicy core](self, "core");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externWorkQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__SUManagerPolicy_resumeDownload___block_invoke;
    block[3] = &unk_24CE3BD58;
    v10 = v4;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __34__SUManagerPolicy_resumeDownload___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)startDownload:(id)a3
{
  -[SUManagerPolicy startDownloadWithOptions:withResult:](self, "startDownloadWithOptions:withResult:", 0, a3);
}

- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUManagerPolicy_startDownloadWithMetadata_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __56__SUManagerPolicy_startDownloadWithMetadata_withResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDownloadWithMetadata:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUManagerPolicy_startDownloadWithOptions_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __55__SUManagerPolicy_startDownloadWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDownloadWithOptions:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  SUDownloadOptions *v8;
  void *v9;
  void *v10;
  SUDownloadOptions *v11;

  v6 = a4;
  v7 = a3;
  v8 = [SUDownloadOptions alloc];
  -[SUManagerPolicy download](self, "download");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUDownloadOptions initWithMetadata:andDescriptor:](v8, "initWithMetadata:andDescriptor:", v7, v10);

  -[SUManagerPolicy updateDownloadOptions:withResult:](self, "updateDownloadOptions:withResult:", v11, v6);
}

- (void)updateDownloadOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SUManagerPolicy_updateDownloadOptions_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __52__SUManagerPolicy_updateDownloadOptions_withResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDownloadOptions:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUManagerPolicy core](self, "core");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __88__SUManagerPolicy_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke;
  v16[3] = &unk_24CE3C2A8;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

}

void __88__SUManagerPolicy_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a4;
  v9 = a5;
  -[SUManagerPolicy core](self, "core");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __96__SUManagerPolicy_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_replyHandler___block_invoke;
  v14[3] = &unk_24CE3C208;
  v17 = a3;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

void __96__SUManagerPolicy_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_replyHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceHasSufficientSpaceForDownloadIncludeAppPurging:descriptor:replyHandler:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)isUpdateReadyForInstallationWithReplyHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke;
  v8[3] = &unk_24CE3B688;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke_2;
  v4[3] = &unk_24CE3D928;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "isUpdateReadyForInstallationWithOptions:replyHandler:", 0, v4);

}

void __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke_2(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  char v14;

  v7 = a4;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "externWorkQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke_3;
    block[3] = &unk_24CE3D900;
    v12 = *(id *)(a1 + 40);
    v13 = a2;
    v14 = a3;
    v11 = v7;
    dispatch_async(v9, block);

  }
}

uint64_t __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2;
  v5[3] = &unk_24CE3D928;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "isUpdateReadyForInstallationWithOptions:replyHandler:", v3, v5);

}

void __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  char v14;

  v7 = a4;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "externWorkQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_3;
    block[3] = &unk_24CE3D900;
    v12 = *(id *)(a1 + 40);
    v13 = a2;
    v14 = a3;
    v11 = v7;
    dispatch_async(v9, block);

  }
}

uint64_t __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));
}

- (BOOL)isUpdateReadyForInstallation:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  -[SUManagerPolicy core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUManagerPolicy_isUpdateReadyForInstallation___block_invoke;
  block[3] = &unk_24CE3B638;
  block[4] = self;
  block[5] = &v11;
  block[6] = a3;
  dispatch_sync(v8, block);

  LOBYTE(a3) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)a3;
}

void __48__SUManagerPolicy_isUpdateReadyForInstallation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isUpdateReadyForInstallation:", *(_QWORD *)(a1 + 48));

}

- (void)autoSUFailedWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SUManagerPolicy_autoSUFailedWithError___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __41__SUManagerPolicy_autoSUFailedWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoSUFailedWithError:", *(_QWORD *)(a1 + 40));

}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SUManagerPolicy_installUpdateWithInstallOptions_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __62__SUManagerPolicy_installUpdateWithInstallOptions_withResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installUpdateWithInstallOptions:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)eligibleRollbackWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  v18 = 0;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SUManagerPolicy_eligibleRollbackWithOptions___block_invoke;
  block[3] = &unk_24CE3C768;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __47__SUManagerPolicy_eligibleRollbackWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eligibleRollbackWithOptions:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUManagerPolicy_rollbackUpdateWithOptions_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

  return 0;
}

void __56__SUManagerPolicy_rollbackUpdateWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackUpdateWithOptions:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)previousRollbackWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  v18 = 0;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SUManagerPolicy_previousRollbackWithOptions___block_invoke;
  block[3] = &unk_24CE3C768;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __47__SUManagerPolicy_previousRollbackWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousRollbackWithOptions:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isRollingBack
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = self;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__SUManagerPolicy_isRollingBack__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = v8[3] != 0;
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __32__SUManagerPolicy_isRollingBack__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isRollingBack");

}

- (void)rollbackReadyForReboot
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SUManagerPolicy_rollbackReadyForReboot__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __41__SUManagerPolicy_rollbackReadyForReboot__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rollbackReadyForReboot");

}

- (BOOL)securityResponseRollbackSuggested:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SUManagerPolicy_securityResponseRollbackSuggested_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  return 0;
}

void __64__SUManagerPolicy_securityResponseRollbackSuggested_withResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "securityResponseRollbackSuggested:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)slaVersion
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __29__SUManagerPolicy_slaVersion__block_invoke;
  v9[3] = &unk_24CE3B5E8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __29__SUManagerPolicy_slaVersion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slaVersion");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)createInstallationKeybag:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke_2;
  v5[3] = &unk_24CE3D950;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "createInstallationKeybag:withResult:", v3, v5);

}

void __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externWorkQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke_3;
    block[3] = &unk_24CE3BC40;
    v10 = *(id *)(a1 + 40);
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)destroyInstallationKeybag
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUManagerPolicy_destroyInstallationKeybag__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __44__SUManagerPolicy_destroyInstallationKeybag__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearKeybagStash");

}

- (BOOL)isAutoUpdateEnabled
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__SUManagerPolicy_isAutoUpdateEnabled__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __38__SUManagerPolicy_isAutoUpdateEnabled__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isAutoUpdateEnabled");

}

- (BOOL)isCurrentUpdateAutoUpdate
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__SUManagerPolicy_isCurrentUpdateAutoUpdate__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __44__SUManagerPolicy_isCurrentUpdateAutoUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isAutoUpdateEnabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "download");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "downloadOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "isAutoDownload");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (unint64_t)softwareUpdatePathRestriction
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__SUManagerPolicy_softwareUpdatePathRestriction__block_invoke;
  v9[3] = &unk_24CE3B5E8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __48__SUManagerPolicy_softwareUpdatePathRestriction__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "softwareUpdatePathRestriction");

}

- (BOOL)isDelayingUpdates
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__SUManagerPolicy_isDelayingUpdates__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __36__SUManagerPolicy_isDelayingUpdates__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isDelayingUpdates");

}

- (id)delayEndDate
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __31__SUManagerPolicy_delayEndDate__block_invoke;
  v9[3] = &unk_24CE3B5E8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __31__SUManagerPolicy_delayEndDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delayEndDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)splatRollbackAllowed:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  -[SUManagerPolicy core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SUManagerPolicy_splatRollbackAllowed___block_invoke;
  block[3] = &unk_24CE3B638;
  block[4] = self;
  block[5] = &v11;
  block[6] = a3;
  dispatch_sync(v8, block);

  LOBYTE(a3) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)a3;
}

void __40__SUManagerPolicy_splatRollbackAllowed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isSplatRollbackAllowed:", *(_QWORD *)(a1 + 48));

}

- (BOOL)isSplatOnlyUpdateRollbackSuggested
{
  SUManagerPolicy *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](v2, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__SUManagerPolicy_isSplatOnlyUpdateRollbackSuggested__block_invoke;
  v8[3] = &unk_24CE3B5E8;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __53__SUManagerPolicy_isSplatOnlyUpdateRollbackSuggested__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isSplatOnlyUpdateRollbackSuggested");

}

- (void)managedInstallRequested
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUManagerPolicy_managedInstallRequested__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v6, block);

}

void __42__SUManagerPolicy_managedInstallRequested__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "managedInstallRequested");

}

- (NSDictionary)mandatoryUpdateDictionary
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__SUManagerPolicy_mandatoryUpdateDictionary__block_invoke;
  v9[3] = &unk_24CE3B5E8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSDictionary *)v7;
}

void __44__SUManagerPolicy_mandatoryUpdateDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mandatoryUpdateDictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setMandatoryUpdateDictionary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__SUManagerPolicy_setMandatoryUpdateDictionary___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __48__SUManagerPolicy_setMandatoryUpdateDictionary___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMandatoryUpdateDictionary:", *(_QWORD *)(a1 + 40));

}

- (void)reportPostponedEvent:(id)a3 withStatus:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUManagerPolicy core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUManagerPolicy_reportPostponedEvent_withStatus___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __51__SUManagerPolicy_reportPostponedEvent_withStatus___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportPostponedEvent:withStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)reportSimulatedOTAAutoTriggeredEvent
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUManagerPolicy_reportSimulatedOTAAutoTriggeredEvent__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __55__SUManagerPolicy_reportSimulatedOTAAutoTriggeredEvent__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reportSimulatedOTAAutoTriggeredEvent");

}

- (void)reportOTAAutoTriggeredEvent
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUManagerPolicy_reportOTAAutoTriggeredEvent__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __46__SUManagerPolicy_reportOTAAutoTriggeredEvent__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reportOTAAutoTriggeredEvent");

}

- (id)download
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __27__SUManagerPolicy_download__block_invoke;
  v9[3] = &unk_24CE3B5E8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __27__SUManagerPolicy_download__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "download");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)installPolicy
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__SUManagerPolicy_installPolicy__block_invoke;
  v9[3] = &unk_24CE3B5E8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __32__SUManagerPolicy_installPolicy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "installPolicy");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)updateInstallPolicyType:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[6];

  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__SUManagerPolicy_updateInstallPolicyType___block_invoke;
  v7[3] = &unk_24CE3B798;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);

}

void __43__SUManagerPolicy_updateInstallPolicyType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateInstallPolicyType:", *(_QWORD *)(a1 + 40));

}

- (void)addUnlockCallback:(SEL)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  SEL v12;

  v6 = a4;
  -[SUManagerPolicy core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUManagerPolicy_addUnlockCallback_forKey___block_invoke;
  block[3] = &unk_24CE3B660;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v9 = v6;
  dispatch_async(v8, block);

}

void __44__SUManagerPolicy_addUnlockCallback_forKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addUnlockCallback:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)removeUnlockCallback:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUManagerPolicy core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__SUManagerPolicy_removeUnlockCallback___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __40__SUManagerPolicy_removeUnlockCallback___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeUnlockCallback:", *(_QWORD *)(a1 + 40));

}

- (void)persistStashOnUnlock
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SUManagerPolicy_persistStashOnUnlock__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __39__SUManagerPolicy_persistStashOnUnlock__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "persistStashOnUnlock");

}

- (void)networkMonitorDetectOverrides
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUManagerPolicy core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUManagerPolicy_networkMonitorDetectOverrides__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __48__SUManagerPolicy_networkMonitorDetectOverrides__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "networkMonitorDetectOverrides");

}

- (SUManagerCore)core
{
  return self->_core;
}

- (void)setCore:(id)a3
{
  objc_storeStrong((id *)&self->_core, a3);
}

- (SUManagerDelegate)delegate
{
  return (SUManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_core, 0);
}

@end
