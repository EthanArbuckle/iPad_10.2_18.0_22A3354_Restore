@implementation PFPosterExtensionInstance

+ (id)extensionInstanceForIdentity:(id)a3 instanceIdentifier:(id)a4
{
  id v5;
  id v6;
  PFPosterExtensionInstance *v7;
  void *v8;
  PFPosterExtensionInstance *v9;

  v5 = a4;
  v6 = a3;
  v7 = [PFPosterExtensionInstance alloc];
  +[PFPosterExtension extensionWithIdentity:](PFPosterExtension, "extensionWithIdentity:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PFPosterExtensionInstance initWithExtension:instanceIdentifier:](v7, "initWithExtension:instanceIdentifier:", v8, v5);
  return v9;
}

+ (id)extensionInstanceForPath:(id)a3 instanceIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDC79F0];
  v8 = objc_alloc(MEMORY[0x24BDC79E8]);
  v9 = (void *)MEMORY[0x24BDD1758];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__PFPosterExtensionInstance_extensionInstanceForPath_instanceIdentifier___block_invoke;
  v17[3] = &unk_251543D70;
  v10 = v5;
  v18 = v10;
  objc_msgSend(v9, "predicateWithBlock:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithExtensionPointIdentifier:predicate:", CFSTR("com.apple.posterkit.provider"), v11);
  objc_msgSend(v7, "executeQuery:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();
    +[PFPosterExtensionInstance extensionInstanceForIdentity:instanceIdentifier:](PFPosterExtensionInstance, "extensionInstanceForIdentity:instanceIdentifier:", v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PFLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[PFPosterExtensionInstance extensionInstanceForPath:instanceIdentifier:].cold.1(v10, v14);
    v15 = 0;
  }

  return v15;
}

uint64_t __73__PFPosterExtensionInstance_extensionInstanceForPath_instanceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

- (PFPosterExtensionInstance)initWithExtension:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PFPosterExtensionInstance *v7;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "pf_defaultInstanceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PFPosterExtensionInstance initWithExtension:instanceIdentifier:](self, "initWithExtension:instanceIdentifier:", v5, v6);

  return v7;
}

- (PFPosterExtensionInstance)initWithExtension:(id)a3 instanceIdentifier:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PFPosterExtensionInstance *v11;
  PFPosterExtensionInstance *v12;
  uint64_t v13;
  NSHashTable *observers;
  uint64_t v15;
  BSAtomicFlag *invalidationFlag;
  uint64_t v17;
  NSUUID *instanceIdentifier;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _EXHostConfiguration *hostConfiguration;
  _EXHostConfiguration *v24;
  uint64_t v25;
  RBSProcessIdentity *processIdentity;
  PFPosterExtensionInstance *result;
  void *v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "pf_defaultInstanceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v32.receiver = self;
    v32.super_class = (Class)PFPosterExtensionInstance;
    v11 = -[PFPosterExtensionInstance init](&v32, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_extension, a3);
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v13 = objc_claimAutoreleasedReturnValue();
      observers = v12->_observers;
      v12->_observers = (NSHashTable *)v13;

      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE0BDA0]), "initWithFlag:", 0);
      invalidationFlag = v12->_invalidationFlag;
      v12->_invalidationFlag = (BSAtomicFlag *)v15;

      v17 = objc_msgSend(v10, "copy");
      instanceIdentifier = v12->_instanceIdentifier;
      v12->_instanceIdentifier = (NSUUID *)v17;

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79C8]), "initWithIdentifier:", v10);
      v20 = objc_alloc(MEMORY[0x24BDC79D8]);
      objc_msgSend(v8, "identity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "initWithExtensionIdentity:instanceIdentifier:", v21, v19);
      hostConfiguration = v12->_hostConfiguration;
      v12->_hostConfiguration = (_EXHostConfiguration *)v22;

      objc_initWeak(&location, v12);
      v24 = v12->_hostConfiguration;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __66__PFPosterExtensionInstance_initWithExtension_instanceIdentifier___block_invoke;
      v29[3] = &unk_251543D98;
      objc_copyWeak(&v30, &location);
      -[_EXHostConfiguration setInterruptionHandler:](v24, "setInterruptionHandler:", v29);
      -[_EXHostConfiguration rbsProcessIdentity](v12->_hostConfiguration, "rbsProcessIdentity");
      v25 = objc_claimAutoreleasedReturnValue();
      processIdentity = v12->_processIdentity;
      v12->_processIdentity = (RBSProcessIdentity *)v25;

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);

    }
    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extension"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterExtensionInstance initWithExtension:instanceIdentifier:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    result = (PFPosterExtensionInstance *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __66__PFPosterExtensionInstance_initWithExtension_instanceIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_extensionProcessDidInterrupt");

}

- (void)dealloc
{
  objc_super v3;

  -[PFPosterExtensionInstance invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PFPosterExtensionInstance;
  -[PFPosterExtensionInstance dealloc](&v3, sel_dealloc);
}

- (void)bootupExtensionInstance:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  PFPosterExtensionInstance *v6;
  void *v7;
  _EXExtensionProcess *extensionProcess;
  NSMutableArray *bootExtensionInstanceCompletionBlocks;
  uint64_t v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  _EXExtensionProcess *v14;
  void *v15;
  _EXHostConfiguration *hostConfiguration;
  _QWORD v17[4];
  id v18;
  id location;

  v4 = (void (**)(id, _QWORD, void *))a3;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    objc_initWeak(&location, self);
    v6 = self;
    objc_sync_enter(v6);
    if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "pf_errorWithCode:", 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, 0, v7);

      }
      goto LABEL_17;
    }
    extensionProcess = v6->_extensionProcess;
    if (extensionProcess && -[_EXExtensionProcess isValid](extensionProcess, "isValid"))
    {
      ((void (**)(id, _EXExtensionProcess *, void *))v4)[2](v4, v6->_extensionProcess, 0);
LABEL_17:
      objc_sync_exit(v6);

      objc_destroyWeak(&location);
      goto LABEL_18;
    }
    bootExtensionInstanceCompletionBlocks = v6->_bootExtensionInstanceCompletionBlocks;
    if (bootExtensionInstanceCompletionBlocks)
    {
      if (!v4)
        goto LABEL_12;
    }
    else
    {
      v10 = objc_opt_new();
      v11 = v6->_bootExtensionInstanceCompletionBlocks;
      v6->_bootExtensionInstanceCompletionBlocks = (NSMutableArray *)v10;

      if (!v4)
      {
LABEL_12:
        if (bootExtensionInstanceCompletionBlocks)
          goto LABEL_17;
LABEL_16:
        v14 = v6->_extensionProcess;
        v6->_extensionProcess = 0;

        v15 = (void *)MEMORY[0x24BDC79D0];
        hostConfiguration = v6->_hostConfiguration;
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __53__PFPosterExtensionInstance_bootupExtensionInstance___block_invoke;
        v17[3] = &unk_251543DC0;
        objc_copyWeak(&v18, &location);
        objc_msgSend(v15, "extensionProcessWithConfiguration:completionHandler:", hostConfiguration, v17);
        objc_destroyWeak(&v18);
        goto LABEL_17;
      }
    }
    v12 = v6->_bootExtensionInstanceCompletionBlocks;
    v13 = (void *)objc_msgSend(v4, "copy");
    -[NSMutableArray addObject:](v12, "addObject:", v13);

    if (bootExtensionInstanceCompletionBlocks)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pf_errorWithCode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v5);

  }
LABEL_18:

}

void __53__PFPosterExtensionInstance_bootupExtensionInstance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_didAcquireExtensionProcess:error:", v6, v5);

}

- (id)bootupExtensionInstanceWithError:(id *)a3
{
  PFPosterExtensionInstance *v6;
  _EXExtensionProcess *extensionProcess;
  void *v8;
  void *v9;
  _EXExtensionProcess *v10;
  uint64_t v11;
  _EXExtensionProcess *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    v6 = self;
    objc_sync_enter(v6);
    extensionProcess = v6->_extensionProcess;
    if (!extensionProcess || !-[_EXExtensionProcess isValid](extensionProcess, "isValid"))
    {
      if (v6->_bootExtensionInstanceCompletionBlocks)
      {
        if (a3)
        {
          v8 = (void *)MEMORY[0x24BDD1540];
          v13 = *MEMORY[0x24BDD0FD8];
          v14[0] = CFSTR("Extension process was already bootstrapped; need to wait until that finishes");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "pf_errorWithCode:userInfo:", 0, v9);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        v10 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDC79D0], "extensionProcessWithConfiguration:error:", v6->_hostConfiguration, a3);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v6->_extensionProcess;
      v6->_extensionProcess = (_EXExtensionProcess *)v11;

    }
    v10 = v6->_extensionProcess;
LABEL_14:
    objc_sync_exit(v6);

    return v10;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pf_errorWithCode:", 2);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)_didAcquireExtensionProcess:(id)a3 error:(id)a4
{
  id v7;
  PFPosterExtensionInstance *v8;
  void *v9;
  NSMutableArray *bootExtensionInstanceCompletionBlocks;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a3;
  v7 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    objc_msgSend(v11, "invalidate");
  }
  else
  {
    v8 = self;
    objc_sync_enter(v8);
    if (v11)
      objc_storeStrong((id *)&v8->_extensionProcess, a3);
    v9 = (void *)-[NSMutableArray copy](v8->_bootExtensionInstanceCompletionBlocks, "copy");
    -[NSMutableArray removeAllObjects](v8->_bootExtensionInstanceCompletionBlocks, "removeAllObjects");
    bootExtensionInstanceCompletionBlocks = v8->_bootExtensionInstanceCompletionBlocks;
    v8->_bootExtensionInstanceCompletionBlocks = 0;

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__PFPosterExtensionInstance__didAcquireExtensionProcess_error___block_invoke;
    v12[3] = &unk_251543DE8;
    v13 = v11;
    v14 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

    objc_sync_exit(v8);
  }

}

void __63__PFPosterExtensionInstance__didAcquireExtensionProcess_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)MEMORY[0x2495143E0](a2);
  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_extensionProcessDidInterrupt
{
  PFPosterExtensionInstance *v3;
  _EXExtensionProcess *extensionProcess;
  _QWORD v5[5];

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v3 = self;
    objc_sync_enter(v3);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__PFPosterExtensionInstance__extensionProcessDidInterrupt__block_invoke;
    v5[3] = &unk_251543E10;
    v5[4] = v3;
    -[PFPosterExtensionInstance _fireObserversRespondingToSelector:block:](v3, "_fireObserversRespondingToSelector:block:", sel_extensionInstanceProcessDidInterrupt_, v5);
    extensionProcess = v3->_extensionProcess;
    v3->_extensionProcess = 0;

    objc_sync_exit(v3);
  }
}

uint64_t __58__PFPosterExtensionInstance__extensionProcessDidInterrupt__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "extensionInstanceProcessDidInterrupt:", *(_QWORD *)(a1 + 32));
}

- (void)addInstanceObserver:(id)a3
{
  PFPosterExtensionInstance *v4;
  id v5;

  v5 = a3;
  if (v5 && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    -[NSHashTable addObject:](v4->_observers, "addObject:", v5);
    objc_sync_exit(v4);

  }
}

- (void)removeInstanceObserver:(id)a3
{
  PFPosterExtensionInstance *v4;
  id v5;

  v5 = a3;
  if (v5 && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
    objc_sync_exit(v4);

  }
}

- (void)_fireObserversRespondingToSelector:(SEL)a3 block:(id)a4
{
  void (**v5)(id, _QWORD);
  PFPosterExtensionInstance *v6;
  NSHashTable *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  v6 = self;
  objc_sync_enter(v6);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6->_observers;
  v8 = 0;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (!v8)
            v8 = (void *)objc_opt_new();
          objc_msgSend(v8, "addObject:", v12);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  objc_sync_exit(v6);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        v5[2](v5, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)invalidate
{
  uint64_t v3;
  PFPosterExtensionInstance *v4;
  void *v5;
  _EXExtensionProcess *extensionProcess;
  id *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    v3 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__PFPosterExtensionInstance_invalidate__block_invoke;
    v9[3] = &unk_251543E10;
    v9[4] = self;
    -[PFPosterExtensionInstance _fireObserversRespondingToSelector:block:](self, "_fireObserversRespondingToSelector:block:", sel_extensionInstanceWillInvalidate_, v9);
    v4 = self;
    objc_sync_enter(v4);
    v5 = (void *)-[NSMutableArray copy](v4->_bootExtensionInstanceCompletionBlocks, "copy");
    -[NSMutableArray removeAllObjects](v4->_bootExtensionInstanceCompletionBlocks, "removeAllObjects");
    objc_sync_exit(v4);

    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_8);
    -[_EXExtensionProcess invalidate](v4->_extensionProcess, "invalidate");
    extensionProcess = v4->_extensionProcess;
    v4->_extensionProcess = 0;

    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __39__PFPosterExtensionInstance_invalidate__block_invoke_3;
    v8[3] = &unk_251543E10;
    v8[4] = v4;
    -[PFPosterExtensionInstance _fireObserversRespondingToSelector:block:](v4, "_fireObserversRespondingToSelector:block:", sel_extensionInstanceDidInvalidate_, v8);
    v7 = v4;
    objc_sync_enter(v7);
    objc_msgSend(v7[5], "removeAllObjects");
    objc_sync_exit(v7);

  }
}

uint64_t __39__PFPosterExtensionInstance_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "extensionInstanceWillInvalidate:", *(_QWORD *)(a1 + 32));
}

void __39__PFPosterExtensionInstance_invalidate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void (**v3)(id, _QWORD, void *);

  v3 = (void (**)(id, _QWORD, void *))MEMORY[0x2495143E0](a2);
  objc_msgSend(MEMORY[0x24BDD1540], "pf_errorWithCode:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, 0, v2);

}

uint64_t __39__PFPosterExtensionInstance_invalidate__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "extensionInstanceDidInvalidate:", *(_QWORD *)(a1 + 32));
}

- (PFPosterExtension)extension
{
  return self->_extension;
}

- (_EXHostConfiguration)hostConfiguration
{
  return self->_hostConfiguration;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (NSUUID)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bootExtensionInstanceCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_acquireAssertions, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
}

+ (void)extensionInstanceForPath:(void *)a1 instanceIdentifier:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_24462A000, a2, OS_LOG_TYPE_ERROR, "No poster providers were found for \"%{public}@\", (uint8_t *)&v5, 0xCu);

}

- (void)initWithExtension:(const char *)a1 instanceIdentifier:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
