@implementation SUKeybagInterface

+ (id)sharedInstance
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)sharedInstance___instance_5;
  if (!sharedInstance___instance_5)
  {
    v3 = -[SUKeybagInterface _init]([SUKeybagInterface alloc], "_init");
    v4 = (void *)sharedInstance___instance_5;
    sharedInstance___instance_5 = (uint64_t)v3;

    v2 = (void *)sharedInstance___instance_5;
  }
  return v2;
}

- (SUKeybagInterface)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUKeybagInterface.m"), 102, CFSTR("Please use the sharedInstance."));

  return 0;
}

- (id)_init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[4];
  int *v17;
  _QWORD v18[5];
  _QWORD handler[5];
  _QWORD v20[5];
  int *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SUKeybagInterface;
  v2 = -[SUKeybagInterface init](&v22, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.softwareupdateservices.keybag", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_queue_create("com.apple.softwareupdateservices.keybag.observerCallout", 0);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v7;

    *((_WORD *)v2 + 12) = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__10;
    v20[4] = __Block_byref_object_dispose__10;
    v9 = (int *)v2;
    v21 = v9;
    v9[10] = -1;
    v10 = MEMORY[0x24BDAC760];
    v11 = *((_QWORD *)v2 + 1);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __26__SUKeybagInterface__init__block_invoke;
    handler[3] = &unk_24CE3C720;
    handler[4] = v20;
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", v9 + 10, v11, handler);
    v9[11] = -1;
    v12 = (const char *)objc_msgSend((id)*MEMORY[0x24BE63B68], "cStringUsingEncoding:", 4);
    v13 = *((_QWORD *)v2 + 1);
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __26__SUKeybagInterface__init__block_invoke_2;
    v18[3] = &unk_24CE3C720;
    v18[4] = v20;
    notify_register_dispatch(v12, v9 + 11, v13, v18);
    v14 = *((_QWORD *)v2 + 1);
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __26__SUKeybagInterface__init__block_invoke_3;
    block[3] = &unk_24CE3B5C0;
    v17 = v9;
    dispatch_sync(v14, block);

    _Block_object_dispose(v20, 8);
  }
  return v2;
}

uint64_t __26__SUKeybagInterface__init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_queue_refreshState");
}

uint64_t __26__SUKeybagInterface__init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_queue_passcodeChanged");
}

uint64_t __26__SUKeybagInterface__init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshState");
}

- (BOOL)hasPasscodeSet
{
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  BSDispatchQueueAssertNot();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__SUKeybagInterface_hasPasscodeSet__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __35__SUKeybagInterface_hasPasscodeSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (BOOL)isPasscodeLocked
{
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  BSDispatchQueueAssertNot();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__SUKeybagInterface_isPasscodeLocked__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __37__SUKeybagInterface_isPasscodeLocked__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 25);
  return result;
}

- (void)addObserver:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUKeybagInterface.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUKeybagInterface_addObserver___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

uint64_t __33__SUKeybagInterface_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUKeybagInterface.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SUKeybagInterface_removeObserver___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

uint64_t __36__SUKeybagInterface_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)hadFirstUnlock
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

- (int)installationKeybagStateForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  uint64_t v49;

  v4 = a3;
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keybagState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!-[SUKeybagInterface hasPasscodeSet](self, "hasPasscodeSet"))
    {
      v26 = CFSTR("No passcode set, keybag is not required");
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isSplatOnly"))
    {
      v26 = CFSTR("Splat update does not require installation keybag");
LABEL_10:
      SULogInfo(v26, v19, v20, v21, v22, v23, v24, v25, v49);
      v18 = 0;
      goto LABEL_37;
    }
    v27 = (void *)MKBKeyBagKeyStashVerify();
    v28 = v27;
    if (!v27)
      goto LABEL_27;
    objc_msgSend(v27, "objectForKey:", CFSTR("StashBagValidOnDisk"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v30 = objc_msgSend(v29, "intValue");
    else
      v30 = 2;
    objc_msgSend(v28, "objectForKey:", CFSTR("StashStagedManifest"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("manifestValue from stashVerify: %@"), v32, v33, v34, v35, v36, v37, v38, (uint64_t)v31);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = objc_msgSend(v31, "BOOLValue");
    else
      v39 = 0;

    if (!v30)
    {
      if (v39)
        v47 = CFSTR("keybag is valid in memory");
      else
        v47 = CFSTR("keybag is in memory, but staged manifest does not exist");
      if (v39)
        v18 = 2;
      else
        v18 = 1;
      goto LABEL_36;
    }
    if (v30 == 1)
    {
      if (v39)
        v47 = CFSTR("keybag is valid and committed");
      else
        v47 = CFSTR("keybag is valid on disk, but staged manifest does not exist");
      if (v39)
        v18 = 3;
      else
        v18 = 1;
    }
    else
    {
LABEL_27:
      v18 = -[SUKeybagInterface hasPasscodeSet](self, "hasPasscodeSet");
      if (v18)
        v47 = CFSTR("keybag is required");
      else
        v47 = CFSTR("keybag is not required");
    }
LABEL_36:
    SULogInfo(v47, v40, v41, v42, v43, v44, v45, v46, v49);

    goto LABEL_37;
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keybagState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  if (v9 >= 3)
    v17 = 3;
  else
    v17 = v9;
  v18 = v17 & ~(v17 >> 31);
  SULogInfo(CFSTR("Override keybag state with %d"), v10, v11, v12, v13, v14, v15, v16, v18);
LABEL_37:

  return v18;
}

- (BOOL)createInstallationKeybagForDescriptor:(id)a3 withSecret:(id)a4 forUnattendedInstall:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  const __CFString *v41;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = CFSTR("secret");
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUKeybagInterface.m"), 253, CFSTR("Invalid parameter not satisfying: %@"));

  }
  +[SUManifestBuilder manifestFromDescriptor:](SUManifestBuilder, "manifestFromDescriptor:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    SULogInfo(CFSTR("createInstallationKeybag - Unable to create stashbag because manifest was required but no manifest was provided."), v12, v13, v14, v15, v16, v17, v18, (uint64_t)v41);
    goto LABEL_10;
  }
  v20 = !v5;
  v21 = 1;
  if (v20)
    v22 = 1;
  else
    v22 = 2;
  -[SUKeybagInterface stringForStashMode:](self, "stringForStashMode:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("createInstallationKeybag - Creating stashbag. stashMode: %@ manifest: %@"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)v23);

  v31 = MKBKeyBagKeyStashCreateWithManifest();
  if ((_DWORD)v31)
  {
    SULogInfo(CFSTR("createInstallationKeybag - Failed to create installation keybag stash from secret: %d"), v32, v33, v34, v35, v36, v37, v38, v31);
LABEL_10:
    v21 = 0;
  }

  return v21;
}

- (BOOL)createInstallationKeybagForDescriptor:(id)a3 withLASecret:(id)a4 forUnattendedInstall:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  BOOL v38;
  void *v40;
  const __CFString *v41;
  const __CFString *v42;
  _QWORD v43[2];

  v5 = a5;
  v43[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = CFSTR("secret");
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUKeybagInterface.m"), 279, CFSTR("Invalid parameter not satisfying: %@"));

  }
  +[SUManifestBuilder manifestFromDescriptor:](SUManifestBuilder, "manifestFromDescriptor:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v5)
      v19 = 2;
    else
      v19 = 1;
    -[SUKeybagInterface stringForStashMode:](self, "stringForStashMode:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("createInstallationKeybag - Creating stashbag with LAContext secret. stashMode: %@ manifest: %@"), v21, v22, v23, v24, v25, v26, v27, (uint64_t)v20);

    v42 = CFSTR("Manifest");
    v43[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "externalizedContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MKBKeyBagKeyStashCreateWithOpts();

    v38 = (_DWORD)v30 == 0;
    if ((_DWORD)v30)
      SULogInfo(CFSTR("createInstallationKeybag - Failed to create installation keybag stash from secret: %d"), v31, v32, v33, v34, v35, v36, v37, v30);

  }
  else
  {
    SULogInfo(CFSTR("createInstallationKeybag - Unable to create stashbag because manifest was required but no manifest was provided."), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v41);
    v38 = 0;
  }

  return v38;
}

- (BOOL)persistKeybagStash
{
  return MKBKeyBagKeyStashPersist() == 0;
}

- (BOOL)disableKeybagStash
{
  return MKBKeyBagKeyStashCreateWithMode() == 0;
}

- (id)createPreventLockAssertionWithDuration:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  SUKeybagPreventLockAssertion *v15;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("MKBAssertionKey");
  v18[1] = CFSTR("MKBAssertionTimeout");
  v19[0] = CFSTR("RemoteProfile");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MKBDeviceLockAssertion();
  if (v6
    && (v14 = (const void *)v6,
        v15 = -[SUKeybagPreventLockAssertion initWithKeybagAssertion:]([SUKeybagPreventLockAssertion alloc], "initWithKeybagAssertion:", v6), CFRelease(v14), v15))
  {
    SULogInfo(CFSTR("Applying prevent lock assertion for duration: %f"), v7, v8, v9, v10, v11, v12, v13, *(uint64_t *)&a3);
  }
  else
  {
    SULogInfo(CFSTR("Failed to create prevent lock assertion"), v7, v8, v9, v10, v11, v12, v13, v17);
    v15 = 0;
  }

  return v15;
}

- (id)stringForStashMode:(int)a3
{
  void *v4;
  void *v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown stash mode (%d)"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 >= 4)
    v6 = v4;
  else
    v6 = off_24CE3CB98[a3];

  return v6;
}

- (void)_queue_refreshState
{
  uint64_t v3;

  BSDispatchQueueAssert();
  v3 = -[SUKeybagInterface _queue_fetchKeybagState](self, "_queue_fetchKeybagState");
  -[SUKeybagInterface _queue_setHasPasscodeSet:](self, "_queue_setHasPasscodeSet:", -[SUKeybagInterface _queue_hasPasscodeSetFromLockState:](self, "_queue_hasPasscodeSetFromLockState:", v3));
  -[SUKeybagInterface _queue_setIsPasscodeLocked:](self, "_queue_setIsPasscodeLocked:", -[SUKeybagInterface _queue_isPasscodeLockedFromLockState:](self, "_queue_isPasscodeLockedFromLockState:", v3));
}

- (void)_queue_passcodeChanged
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *observerCalloutQueue;
  id v12;
  uint64_t v13[4];
  id v14;
  SUKeybagInterface *v15;

  BSDispatchQueueAssert();
  SULogInfo(CFSTR("SUKeybagInterface got passcode changed event"), v3, v4, v5, v6, v7, v8, v9, v13[0]);
  -[SUKeybagInterface _queue_refreshState](self, "_queue_refreshState");
  -[NSHashTable allObjects](self->_queue_observers, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  observerCalloutQueue = self->_observerCalloutQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = (uint64_t)__43__SUKeybagInterface__queue_passcodeChanged__block_invoke;
  v13[3] = (uint64_t)&unk_24CE3B610;
  v14 = v10;
  v15 = self;
  v12 = v10;
  dispatch_async(observerCalloutQueue, v13);

}

void __43__SUKeybagInterface__queue_passcodeChanged__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "keybagInterfacePasscodeDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (int)_queue_fetchKeybagState
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  v3[0] = *MEMORY[0x24BE67230];
  v3[1] = CFSTR("ExtendedDeviceLockState");
  v4[0] = &unk_24CE6E0A0;
  v4[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return MKBGetDeviceLockState();
}

- (BOOL)_queue_isPasscodeLockedFromLockState:(int)a3
{
  BSDispatchQueueAssert();
  return (a3 < 7) & (0x46u >> a3);
}

- (BOOL)_queue_hasPasscodeSetFromLockState:(int)a3
{
  BSDispatchQueueAssert();
  return a3 != 3;
}

- (void)_queue_setHasPasscodeSet:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *observerCalloutQueue;
  id v7;
  _QWORD block[4];
  id v9;
  SUKeybagInterface *v10;
  BOOL v11;

  v3 = a3;
  BSDispatchQueueAssert();
  if (self->_queue_hasPasscodeSet != v3)
  {
    self->_queue_hasPasscodeSet = v3;
    -[NSHashTable allObjects](self->_queue_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    observerCalloutQueue = self->_observerCalloutQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__SUKeybagInterface__queue_setHasPasscodeSet___block_invoke;
    block[3] = &unk_24CE3C498;
    v9 = v5;
    v10 = self;
    v11 = v3;
    v7 = v5;
    dispatch_async(observerCalloutQueue, block);

  }
}

void __46__SUKeybagInterface__queue_setHasPasscodeSet___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "keybagInterface:hasPasscodeSetDidChange:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_queue_setIsPasscodeLocked:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *observerCalloutQueue;
  id v7;
  _QWORD block[4];
  id v9;
  SUKeybagInterface *v10;
  BOOL v11;

  v3 = a3;
  BSDispatchQueueAssert();
  if (self->_queue_isPasscodeLocked != v3)
  {
    self->_queue_isPasscodeLocked = v3;
    -[NSHashTable allObjects](self->_queue_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    observerCalloutQueue = self->_observerCalloutQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__SUKeybagInterface__queue_setIsPasscodeLocked___block_invoke;
    block[3] = &unk_24CE3C498;
    v9 = v5;
    v10 = self;
    v11 = v3;
    v7 = v5;
    dispatch_async(observerCalloutQueue, block);

  }
}

void __48__SUKeybagInterface__queue_setIsPasscodeLocked___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "keybagInterface:passcodeLockedStateDidChange:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_observerCalloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
