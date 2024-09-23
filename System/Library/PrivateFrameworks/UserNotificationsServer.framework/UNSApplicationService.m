@implementation UNSApplicationService

- (UNSApplicationService)initWithApplicationLauncher:(id)a3 categoryRepository:(id)a4 localizationService:(id)a5
{
  id v9;
  id v10;
  id v11;
  UNSApplicationService *v12;
  UNSApplicationService *v13;
  NSMutableSet *v14;
  NSMutableSet *foregroundBundleIdentifiers;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)UNSApplicationService;
  v12 = -[UNSApplicationService init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_applicationLauncher, a3);
    objc_storeStrong((id *)&v13->_categoryRepository, a4);
    objc_storeStrong((id *)&v13->_localizationService, a5);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    foregroundBundleIdentifiers = v13->_foregroundBundleIdentifiers;
    v13->_foregroundBundleIdentifiers = v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.usernotificationsserver.ApplicationService", v16);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v17;

  }
  return v13;
}

- (void)didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__UNSApplicationService_didChangeProcessState_forBundleIdentifier___block_invoke;
  block[3] = &unk_24D639EA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __67__UNSApplicationService_didChangeProcessState_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeProcessState:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)isApplicationForeground:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__UNSApplicationService_isApplicationForeground___block_invoke;
  block[3] = &unk_24D63A2C0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __49__UNSApplicationService_isApplicationForeground___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __91__UNSApplicationService_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_24D63A748;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __91__UNSApplicationService_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_willPresentNotification:forBundleIdentifier:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_queue_didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    if (objc_msgSend(v9, "isRunning")
      && (objc_msgSend(v9, "endowmentNamespaces"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.frontboard.visibility")),
          v7,
          v8))
    {
      -[NSMutableSet addObject:](self->_foregroundBundleIdentifiers, "addObject:", v6);
    }
    else
    {
      -[NSMutableSet removeObject:](self->_foregroundBundleIdentifiers, "removeObject:", v6);
    }
  }

}

- (void)_queue_willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UNSApplicationLauncher *applicationLauncher;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[NSMutableSet containsObject:](self->_foregroundBundleIdentifiers, "containsObject:", v9))
  {
    -[UNCLocalizationService bundleWithIdentifier:](self->_localizationService, "bundleWithIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBF400]), "initWithBundle:categoryRepository:", v11, self->_categoryRepository);
    objc_msgSend(v12, "notificationForNotificationRecord:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    applicationLauncher = self->_applicationLauncher;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __98__UNSApplicationService__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke;
    v15[3] = &unk_24D63A770;
    v16 = v10;
    -[UNSApplicationLauncher willPresentNotification:forBundleIdentifier:withCompletionHandler:](applicationLauncher, "willPresentNotification:forBundleIdentifier:withCompletionHandler:", v13, v9, v15);

  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 27, 0);
  }

}

uint64_t __98__UNSApplicationService__queue_willPresentNotification_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_applicationLauncher, 0);
  objc_storeStrong((id *)&self->_foregroundBundleIdentifiers, 0);
}

@end
