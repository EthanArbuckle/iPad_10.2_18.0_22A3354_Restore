@implementation SUInstallationConstraintObserver

- (SUInstallationConstraintObserver)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUInstallationConstraintObserver.m"), 84, CFSTR("Init is unsupported.  Please use -[SUInstallationConstraintObserver initWithDownload:] instead."));

  return 0;
}

- (SUInstallationConstraintObserver)initWithDownload:(id)a3
{
  return -[SUInstallationConstraintObserver initWithDownload:andInstallOptions:](self, "initWithDownload:andInstallOptions:", a3, 0);
}

- (SUInstallationConstraintObserver)initWithDownload:(id)a3 andInstallOptions:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  SUInstallationConstraintObserver *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  SUInstallationConstraintObserver *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  char v35;
  BOOL v36;
  uint8_t buf[4];
  SUInstallationConstraintObserver *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = dispatch_queue_create("com.apple.softwareupdateservices.installationconstraints.bg", 0);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.softwareupdateservices"));

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "currentAudioAndVideoCallCount") != 0;
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __71__SUInstallationConstraintObserver_initWithDownload_andInstallOptions___block_invoke;
  v29 = &unk_24CE3CAA0;
  v15 = v9;
  v30 = v15;
  v16 = v8;
  v31 = v16;
  v17 = v6;
  v32 = v17;
  v18 = v7;
  v35 = v12;
  v33 = v18;
  v34 = v13;
  v36 = v14;
  v19 = v13;
  dispatch_sync(v16, &v26);
  v20 = -[SUInstallationConstraintObserver initWithDownload:installOptions:queue:constraints:](self, "initWithDownload:installOptions:queue:constraints:", v17, v18, v16, v15, v26, v27, v28, v29);
  SULogInstallConstraints();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    SUStringFromInstallationConstraints(-[SUComposedInstallationConstraintMonitor unsatisfiedConstraints](v20, "unsatisfiedConstraints"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v20;
    v39 = 2112;
    v40 = v22;
    _os_log_impl(&dword_2128D9000, v21, OS_LOG_TYPE_INFO, "[InstallationConstraintObserver] Create: %@ (unsatisfied constraints: %@)", buf, 0x16u);

  }
  v23 = v34;
  v24 = v20;

  return v24;
}

void __71__SUInstallationConstraintObserver_initWithDownload_andInstallOptions___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  SUInstallationConstraintMonitorPhoneCalls *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;

  v2 = *(void **)(a1 + 32);
  v3 = -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag initOnQueue:withDownload:andInstallOptions:]([SUInstallationConstraintMonitorForBatteryDiskAndKeybag alloc], "initOnQueue:withDownload:andInstallOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(v2, "addObject:", v3);

  v4 = *(void **)(a1 + 32);
  v5 = -[SUInstallationConstraintMonitorNetwork initOnQueue:withDownload:]([SUInstallationConstraintMonitorNetwork alloc], "initOnQueue:withDownload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "addObject:", v5);

  LODWORD(v5) = *(unsigned __int8 *)(a1 + 72);
  v6 = *(void **)(a1 + 32);
  v7 = [SUInstallationConstraintMonitorPhoneCalls alloc];
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  if ((_DWORD)v5)
    v10 = -[SUInstallationConstraintMonitorPhoneCalls initOnQueue:withDownload:callCenter:inSpringBoard:onExistingPhoneCall:](v7, "initOnQueue:withDownload:callCenter:inSpringBoard:onExistingPhoneCall:", v8, v9, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73));
  else
    v10 = -[SUInstallationConstraintMonitorPhoneCalls initOnQueue:withDownload:](v7, "initOnQueue:withDownload:", v8, v9);
  v11 = (void *)v10;
  objc_msgSend(v6, "addObject:", v10);

  v12 = *(void **)(a1 + 32);
  v13 = -[SUInstallationConstraintMonitorRestoreFromICloud initOnQueue:withDownload:]([SUInstallationConstraintMonitorRestoreFromICloud alloc], "initOnQueue:withDownload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v12, "addObject:", v13);

  v14 = *(void **)(a1 + 32);
  v15 = -[SUInstallationConstraintMonitorRestoreFromITunes initOnQueue:withDownload:]([SUInstallationConstraintMonitorRestoreFromITunes alloc], "initOnQueue:withDownload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v14, "addObject:", v15);

  v16 = *(void **)(a1 + 32);
  v17 = -[SUInstallationConstraintMonitorSync initOnQueue:withDownload:]([SUInstallationConstraintMonitorSync alloc], "initOnQueue:withDownload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v16, "addObject:", v17);

  v18 = *(void **)(a1 + 32);
  v19 = -[SUInstallationConstraintMonitorCarplay initOnQueue:withDownload:]([SUInstallationConstraintMonitorCarplay alloc], "initOnQueue:withDownload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v18, "addObject:", v19);

  v20 = *(void **)(a1 + 32);
  v21 = -[SUInstallationConstraintMonitorMediaPlaying initOnQueue:withDownload:]([SUInstallationConstraintMonitorMediaPlaying alloc], "initOnQueue:withDownload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v20, "addObject:", v21);

  v22 = *(void **)(a1 + 32);
  v23 = -[SUInstallationConstraintMonitorDriving initOnQueue:withDownload:]([SUInstallationConstraintMonitorDriving alloc], "initOnQueue:withDownload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v22, "addObject:", v23);

  v24 = *(void **)(a1 + 32);
  v25 = -[SUInstallationConstraintMonitorWombat initOnQueue:withDownload:]([SUInstallationConstraintMonitorWombat alloc], "initOnQueue:withDownload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v24, "addObject:", v25);

}

- (SUInstallationConstraintObserver)initWithDownload:(id)a3 queue:(id)a4 constraints:(id)a5
{
  return -[SUInstallationConstraintObserver initWithDownload:installOptions:queue:constraints:](self, "initWithDownload:installOptions:queue:constraints:", a3, 0, a4, a5);
}

- (SUInstallationConstraintObserver)initWithDownload:(id)a3 installOptions:(id)a4 queue:(id)a5 constraints:(id)a6
{
  id v11;
  id v12;
  SUInstallationConstraintObserver *v13;
  SUInstallationConstraintObserver *v14;
  uint64_t v15;
  NSMapTable *queue_observerBlockTokens;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SUInstallationConstraintObserver;
  v13 = -[SUComposedInstallationConstraintMonitor initWithInternalQueue:withInstallationConstraintMonitors:](&v18, sel_initWithInternalQueue_withInstallationConstraintMonitors_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_download, a3);
    objc_storeStrong((id *)&v14->_installOptions, a4);
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 517, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    queue_observerBlockTokens = v14->_queue_observerBlockTokens;
    v14->_queue_observerBlockTokens = (NSMapTable *)v15;

    v14->_queue_tokenCount = 0;
  }

  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  SUInstallationConstraintObserver *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SULogInstallConstraints();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_2128D9000, v3, OS_LOG_TYPE_INFO, "[InstallationConstraintObserver] Dealloc: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)SUInstallationConstraintObserver;
  -[SUComposedInstallationConstraintMonitor dealloc](&v4, sel_dealloc);
}

- (id)registerObserverBlock:(id)a3
{
  id v5;
  NSObject *queue;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUInstallationConstraintObserver.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  v24 = 0;
  queue = self->super._queue;
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SUInstallationConstraintObserver_registerObserverBlock___block_invoke;
  block[3] = &unk_24CE3CAC8;
  block[4] = self;
  v18 = &v19;
  v8 = v5;
  v17 = v8;
  dispatch_sync(queue, block);
  v9 = self->super._queue;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __58__SUInstallationConstraintObserver_registerObserverBlock___block_invoke_2;
  v14[3] = &unk_24CE3BD58;
  v14[4] = self;
  v15 = v8;
  v10 = v8;
  dispatch_async(v9, v14);
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __58__SUInstallationConstraintObserver_registerObserverBlock___block_invoke(uint64_t a1)
{
  _SUInstallationConstraintBlockObserverToken *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v2 = -[_SUInstallationConstraintBlockObserverToken initWithObserver:]([_SUInstallationConstraintBlockObserverToken alloc], "initWithObserver:", *(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      v7 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
      v6 = (void *)MEMORY[0x212BF6094]();
      objc_msgSend(v5, "setObject:forKey:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    }
  }
}

uint64_t __58__SUInstallationConstraintObserver_registerObserverBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_queue_unsatisfiedConstraints"), objc_msgSend(*(id *)(a1 + 32), "_queue_representedConstraints"), 0);
}

- (void)invalidateWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->super._queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUInstallationConstraintObserver_invalidateWithError___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __56__SUInstallationConstraintObserver_invalidateWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  SULogInstallConstraints();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v3;
    _os_log_impl(&dword_2128D9000, v2, OS_LOG_TYPE_INFO, "[InstallationConstraintObserver] Invalidate: %@", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 72))
  {
    *(_BYTE *)(v4 + 72) = 1;
    if (*(_QWORD *)(a1 + 40))
    {
      v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
      objc_msgSend(v5, "objectEnumerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), 0, objc_msgSend(*(id *)(a1 + 32), "_queue_representedConstraints", (_QWORD)v14), *(_QWORD *)(a1 + 40));
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateChildConstraintMonitors", (_QWORD)v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 64);
    *(_QWORD *)(v12 + 64) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_queue_clearDelegate");
  }
}

- (id)monitorOfClass:(Class)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUInstallationConstraintObserver_monitorOfClass___block_invoke;
  block[3] = &unk_24CE3CAF0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__SUInstallationConstraintObserver_monitorOfClass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  objc_msgSend(*(id *)(a1 + 32), "constraintMonitors", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)invalidate
{
  -[SUInstallationConstraintObserver invalidateWithError:](self, "invalidateWithError:", 0);
}

- (void)_queue_noteInstallationConstraintMonitor:(id)a3 constraintsDidChange:(unint64_t)a4
{
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  SUInstallationConstraintObserver *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  v6 = -[SUComposedInstallationConstraintMonitor _queue_unsatisfiedConstraints](self, "_queue_unsatisfiedConstraints");
  SULogInstallConstraints();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    SUStringFromInstallationConstraints(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_2128D9000, v7, OS_LOG_TYPE_INFO, "%@ - unsatisfied constraints changed (unsatisfied? %@)", buf, 0x16u);

  }
  v9 = (void *)-[NSMapTable copy](self->_queue_observerBlockTokens, "copy");
  objc_msgSend(v9, "objectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15));
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  -[SUComposedInstallationConstraintMonitor _queue_delegate](self, "_queue_delegate", (_QWORD)v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "installationConstraintMonitor:constraintsDidChange:", self, a4);

}

- (void)_removeToken:(id)a3
{
  NSObject *queue;
  void *v6;
  _QWORD block[5];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUInstallationConstraintObserver.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SUInstallationConstraintObserver__removeToken___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __49__SUInstallationConstraintObserver__removeToken___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[10])
  {
    objc_msgSend(v2, "_queue_delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "installationConstraintObserverDidRemoveAllObserverBlocks:", *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)_hasAnyBlockObservers
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->super._queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__SUInstallationConstraintObserver__hasAnyBlockObservers__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SUInstallationConstraintObserver__hasAnyBlockObservers__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 80) != 0;
  return result;
}

- (SUDownload)download
{
  return self->_download;
}

- (SUInstallOptions)installOptions
{
  return self->_installOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observerBlockTokens, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_download, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
