@implementation WFResource

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeApplicationStateObserver:forEvent:", self, 3);

  v4.receiver = self;
  v4.super_class = (Class)WFResource;
  -[WFResource dealloc](&v4, sel_dealloc);
}

- (WFResource)init
{
  return -[WFResource initWithDefinition:](self, "initWithDefinition:", 0);
}

- (WFResource)initWithDefinition:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFResource;
  v5 = -[WFResource init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v6;

    *((_BYTE *)v5 + 9) = 1;
    v8 = dispatch_queue_create("com.apple.shortcuts.WFResource.stateAccessQueue", 0);
    v9 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v8;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v5 + 4), &WFStateAccessQueueSpecificKey, *((void **)v5 + 4), 0);
    if (objc_msgSend((id)objc_opt_class(), "refreshesAvailabilityOnApplicationResume"))
    {
      objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addApplicationStateObserver:forEvent:", v5, 3);

    }
    v11 = v5;
  }

  return (WFResource *)v5;
}

+ (BOOL)refreshesAvailabilityOnApplicationResume
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateAccessQueue, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_availabilityError, 0);
}

- (NSDictionary)eventDictionary
{
  objc_class *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("resource_name");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (BOOL)isAvailable
{
  NSObject *stateAccessQueue;
  uint64_t v4;
  NSObject *v5;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__WFResource_isAvailable__block_invoke;
  block[3] = &unk_1E7AF92E8;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(stateAccessQueue, block);
  if (*((_BYTE *)v15 + 24))
    -[WFResource refreshAvailability](self, "refreshAvailability");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = self->_stateAccessQueue;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __25__WFResource_isAvailable__block_invoke_2;
  v8[3] = &unk_1E7AF92E8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

- (NSError)availabilityError
{
  NSObject *stateAccessQueue;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__WFResource_availabilityError__block_invoke;
  block[3] = &unk_1E7AF92E8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(stateAccessQueue, block);
  if (*((_BYTE *)v17 + 24))
    -[WFResource refreshAvailability](self, "refreshAvailability");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__11346;
  v13 = __Block_byref_object_dispose__11347;
  v14 = 0;
  v5 = self->_stateAccessQueue;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __31__WFResource_availabilityError__block_invoke_48;
  v8[3] = &unk_1E7AF92E8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v16, 8);
  return (NSError *)v6;
}

- (void)refreshAvailabilityIfNeeded
{
  NSObject *stateAccessQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__WFResource_refreshAvailabilityIfNeeded__block_invoke;
  v4[3] = &unk_1E7AF92E8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(stateAccessQueue, v4);
  if (*((_BYTE *)v6 + 24))
    -[WFResource refreshAvailability](self, "refreshAvailability");
  _Block_object_dispose(&v5, 8);
}

- (BOOL)_isAvailable
{
  return self->_available;
}

- (id)_availabilityError
{
  return self->_availabilityError;
}

- (void)refreshAvailabilityWithNotification
{
  -[WFResource refreshAvailabilityWithNotification:](self, "refreshAvailabilityWithNotification:", 0);
}

- (void)refreshAvailabilityWithForcedNotification
{
  -[WFResource refreshAvailabilityWithNotification:](self, "refreshAvailabilityWithNotification:", 1);
}

- (BOOL)shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification:(BOOL)a3
{
  NSObject *stateAccessQueue;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD block[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__11346;
  v26 = __Block_byref_object_dispose__11347;
  v27 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__WFResource_shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification___block_invoke;
  block[3] = &unk_1E7AF5B20;
  block[4] = self;
  block[5] = &v28;
  block[6] = &v22;
  dispatch_sync(stateAccessQueue, block);
  -[WFResource refreshAvailability](self, "refreshAvailability");
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11346;
  v15 = __Block_byref_object_dispose__11347;
  v16 = 0;
  v7 = self->_stateAccessQueue;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __81__WFResource_shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification___block_invoke_2;
  v10[3] = &unk_1E7AF5B20;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  dispatch_sync(v7, v10);
  v8 = a3
    || *((unsigned __int8 *)v18 + 24) != *((unsigned __int8 *)v29 + 24)
    || (objc_msgSend((id)v12[5], "isEqual:", v23[5]) & 1) == 0 && v12[5] != v23[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v8;
}

- (void)notifyResourcesAboutAvailabilityChange
{
  void (**v2)(_QWORD);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__WFResource_notifyResourcesAboutAvailabilityChange__block_invoke;
  aBlock[3] = &unk_1E7AF94B0;
  aBlock[4] = self;
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v2[2](v2);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v2);

}

- (void)refreshAvailabilityWithNotification:(BOOL)a3
{
  if (-[WFResource shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification:](self, "shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification:", a3))
  {
    -[WFResource notifyResourcesAboutAvailabilityChange](self, "notifyResourcesAboutAvailabilityChange");
  }
}

- (void)updateAvailability:(BOOL)a3 withError:(id)a4
{
  -[WFResource updateAvailability:withError:completionHandler:](self, "updateAvailability:withError:completionHandler:", a3, a4, 0);
}

- (void)updateAvailability:(BOOL)a3 withError:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *stateAccessQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  stateAccessQueue = self->_stateAccessQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__WFResource_updateAvailability_withError_completionHandler___block_invoke;
  v13[3] = &unk_1E7AF41B8;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(stateAccessQueue, v13);

}

- (void)invalidateAvailability
{
  NSObject *stateAccessQueue;
  _QWORD block[5];

  stateAccessQueue = self->_stateAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__WFResource_invalidateAvailability__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(stateAccessQueue, block);
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (BOOL)shouldRefreshAvailability
{
  return self->_shouldRefreshAvailability;
}

- (OS_dispatch_queue)stateAccessQueue
{
  return self->_stateAccessQueue;
}

uint64_t __36__WFResource_invalidateAvailability__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 1;
  return result;
}

uint64_t __61__WFResource_updateAvailability_withError_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(a1 + 56);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__WFResource_notifyResourcesAboutAvailabilityChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFResourceAvailabilityChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __81__WFResource_shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification___block_invoke(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 8);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 16));
}

void __81__WFResource_shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification___block_invoke_2(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 8);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 16));
}

uint64_t __41__WFResource_refreshAvailabilityIfNeeded__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 0;
  return result;
}

uint64_t __31__WFResource_availabilityError__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 0;
  return result;
}

void __31__WFResource_availabilityError__block_invoke_48(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __25__WFResource_isAvailable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 0;
  return result;
}

uint64_t __25__WFResource_isAvailable__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

+ (id)sharedInstance
{
  void *v2;

  if (sharedInstance_onceToken_11359 != -1)
    dispatch_once(&sharedInstance_onceToken_11359, &__block_literal_global_11360);
  objc_msgSend((id)sharedInstance_lock, "lock");
  objc_msgSend((id)sharedInstance_sharedInstances, "objectForKey:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend((id)sharedInstance_sharedInstances, "setObject:forKey:", v2, objc_opt_class());
  }
  objc_msgSend((id)sharedInstance_lock, "unlock");
  return v2;
}

+ (BOOL)isSingleton
{
  return 0;
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 0;
}

+ (BOOL)alwaysMakeAvailable
{
  return 0;
}

void __28__WFResource_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstances;
  sharedInstance_sharedInstances = v0;

  v2 = objc_alloc_init(MEMORY[0x1E0CB38E0]);
  v3 = (void *)sharedInstance_lock;
  sharedInstance_lock = (uint64_t)v2;

}

@end
