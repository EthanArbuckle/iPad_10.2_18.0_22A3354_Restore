@implementation SBApplicationTestingManager

- (void)markUserLaunchInitiationTime
{
  void *v2;
  void *v3;
  id v4;
  char __dst[4];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[SBApplicationTestingManager currentTestName](self, "currentTestName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_retainAutorelease(v2);
    strncpy(__dst, (const char *)objc_msgSend(v4, "UTF8String"), 0x10uLL);
    objc_msgSend(v4, "hash");
    objc_msgSend(v4, "length");
    kdebug_trace();
  }

}

- (NSString)currentTestName
{
  return self->_currentTestName;
}

+ (id)sharedInstance
{
  void *v2;
  SBApplicationTestingManager *v3;
  void *v4;

  v2 = (void *)sharedInstance_sharedInstance_2;
  if (!sharedInstance_sharedInstance_2)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBApplicationTestingManager);
    v4 = (void *)sharedInstance_sharedInstance_2;
    sharedInstance_sharedInstance_2 = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)sharedInstance_sharedInstance_2;
  }
  return v2;
}

- (void)setCurrentTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SBApplicationTestingManager)init
{
  SBApplicationTestingManager *v2;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBApplicationTestingManager;
  v2 = -[SBApplicationTestingManager init](&v6, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

  }
  return v2;
}

- (void)setupKeyboardAnimationSubTestsForTestName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CEB978];
  v7 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke;
  v28[3] = &unk_1E8EAF9A8;
  v8 = v5;
  v29 = v8;
  v9 = v4;
  v30 = v9;
  -[SBApplicationTestingManager installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v6, 1, v28);
  v10 = *MEMORY[0x1E0CEB828];
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_2;
  v25[3] = &unk_1E8EAF9A8;
  v11 = v8;
  v26 = v11;
  v12 = v9;
  v27 = v12;
  -[SBApplicationTestingManager installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v10, 1, v25);
  v13 = *MEMORY[0x1E0CEB970];
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_3;
  v22[3] = &unk_1E8EAF9A8;
  v14 = v11;
  v23 = v14;
  v15 = v12;
  v24 = v15;
  -[SBApplicationTestingManager installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v13, 1, v22);
  v16 = *MEMORY[0x1E0CEB820];
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_4;
  v19[3] = &unk_1E8EAF9A8;
  v20 = v14;
  v21 = v15;
  v17 = v15;
  v18 = v14;
  -[SBApplicationTestingManager installNotificationObserverForNotificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:forOneNotification:usingBlock:", v16, 1, v19);

}

uint64_t __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:", CFSTR("keyboardShowing"), *(_QWORD *)(a1 + 40));
}

uint64_t __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("keyboardShowing"), *(_QWORD *)(a1 + 40));
}

uint64_t __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:", CFSTR("keyboardHiding"), *(_QWORD *)(a1 + 40));
}

uint64_t __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("keyboardHiding"), *(_QWORD *)(a1 + 40));
}

- (void)installNotificationObserverForNotificationName:(id)a3 notificationCenter:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__59;
  v35 = __Block_byref_object_dispose__59;
  v36 = 0;
  v15 = v13;
  v16 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __127__SBApplicationTestingManager_installNotificationObserverForNotificationName_notificationCenter_forOneNotification_usingBlock___block_invoke;
  v26[3] = &unk_1E8EAF9D0;
  v29 = &v31;
  v30 = a5;
  v17 = v15;
  v27 = v17;
  v18 = v11;
  v28 = v18;
  objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", v9, 0, v14, v26);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v32[5];
  v32[5] = v19;

  +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __127__SBApplicationTestingManager_installNotificationObserverForNotificationName_notificationCenter_forOneNotification_usingBlock___block_invoke_2;
  v23[3] = &unk_1E8E9DFA0;
  v25 = &v31;
  v22 = v17;
  v24 = v22;
  objc_msgSend(v21, "_installTestEndedHandler:", v23);

  _Block_object_dispose(&v31, 8);
}

void __127__SBApplicationTestingManager_installNotificationObserverForNotificationName_notificationCenter_forOneNotification_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = v3;
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObserver:");
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = 0;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = v7;
  }

}

void __127__SBApplicationTestingManager_installNotificationObserverForNotificationName_notificationCenter_forOneNotification_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
}

- (void)installNotificationObserverForNotificationName:(id)a3 forOneNotification:(BOOL)a4 usingBlock:(id)a5
{
  -[SBApplicationTestingManager installNotificationObserverForNotificationName:notificationCenter:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationCenter:forOneNotification:usingBlock:", a3, 0, a4, a5);
}

- (void)_prepareForTestStartup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *idleTimerDisableAssertions;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PPT Test %@"), v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireIdleTimerDisableAssertionForReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  idleTimerDisableAssertions = self->_idleTimerDisableAssertions;
  if (!idleTimerDisableAssertions)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_idleTimerDisableAssertions;
    self->_idleTimerDisableAssertions = v8;

    idleTimerDisableAssertions = self->_idleTimerDisableAssertions;
  }
  -[NSMutableDictionary objectForKey:](idleTimerDisableAssertions, "objectForKey:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    -[NSMutableDictionary setObject:forKey:](self->_idleTimerDisableAssertions, "setObject:forKey:", v6, v11);

}

- (void)_handleTestEnded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[SBApplicationTestingManager _idleTimerDisableAssertions](self, "_idleTimerDisableAssertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationTestingManager currentTestName](self, "currentTestName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    -[SBApplicationTestingManager _idleTimerDisableAssertions](self, "_idleTimerDisableAssertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationTestingManager currentTestName](self, "currentTestName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("SBApplicationDidExitNotification"), 0);

  -[SBApplicationTestingManager setCurrentTestName:](self, "setCurrentTestName:", 0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__59;
  v23 = __Block_byref_object_dispose__59;
  v24 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBApplicationTestingManager__handleTestEnded__block_invoke;
  block[3] = &unk_1E8E9DFA0;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(queue, block);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = (id)v20[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    }
    while (v11);
  }

  _Block_object_dispose(&v19, 8);
}

void __47__SBApplicationTestingManager__handleTestEnded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = 0;

}

- (void)_installTestEndedHandler:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v6 = a3;
  -[SBApplicationTestingManager currentTestName](self, "currentTestName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SBApplicationTestingManager__installTestEndedHandler___block_invoke;
    block[3] = &unk_1E8EA02D8;
    block[4] = self;
    v8 = v6;
    dispatch_sync(queue, block);

  }
}

void __56__SBApplicationTestingManager__installTestEndedHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  v6 = (id)MEMORY[0x1D17E5550](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v6);

}

- (NSMutableDictionary)_idleTimerDisableAssertions
{
  return self->_idleTimerDisableAssertions;
}

- (NSString)scrollTestActiveSubtest
{
  return self->_scrollTestActiveSubtest;
}

- (void)setScrollTestActiveSubtest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollTestActiveSubtest, 0);
  objc_storeStrong((id *)&self->_currentTestName, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertions, 0);
  objc_storeStrong((id *)&self->_queue_testEndedHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
