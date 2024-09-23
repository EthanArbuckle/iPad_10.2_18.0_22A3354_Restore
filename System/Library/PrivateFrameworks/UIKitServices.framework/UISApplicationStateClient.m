@implementation UISApplicationStateClient

void __42__UISApplicationStateClient__remoteTarget__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)MEMORY[0x1E0D23040];
  v4 = a2;
  objc_msgSend(v3, "utility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v5);

  objc_msgSend(v4, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__UISApplicationStateClient__remoteTarget__block_invoke_5;
  v6[3] = &unk_1E2CAF430;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setInvalidationHandler:", v6);

}

- (void)setMinimumBackgroundFetchInterval:(double)a3
{
  void *v4;
  id v5;

  -[UISApplicationStateClient _remoteTarget](self, "_remoteTarget");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumBackgroundFetchInterval:", v4);

}

void __42__UISApplicationStateClient__remoteTarget__block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD v25[5];

  v2 = *(void **)(a1[4] + 32);
  if (v2)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0D22FE8], "interfaceWithIdentifier:", 0x1E2CAFE60);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22FF8], "protocolForProtocol:", &unk_1EE1E8650);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServer:", v4);

  v5 = (void *)MEMORY[0x1E0D23018];
  objc_msgSend(MEMORY[0x1E0D23018], "defaultShellMachName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpointForMachName:service:instance:", v6, 0x1E2CAFE60, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __42__UISApplicationStateClient__remoteTarget__block_invoke_2;
  v25[3] = &unk_1E2CAF3E8;
  v25[4] = a1[4];
  objc_msgSend(MEMORY[0x1E0D23010], "connectionWithEndpoint:clientContextBuilder:", v7, v25);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = a1[4];
  v11 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v9;

  v12 = a1[4];
  v13 = *(void **)(v12 + 32);
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __42__UISApplicationStateClient__remoteTarget__block_invoke_3;
  v22[3] = &unk_1E2CAF458;
  v23 = v3;
  v24 = v12;
  v14 = v3;
  objc_msgSend(v13, "configureConnection:", v22);
  objc_msgSend(*(id *)(a1[4] + 32), "activate");

  v2 = *(void **)(a1[4] + 32);
  if (v2)
  {
LABEL_3:
    objc_msgSend(v2, "remoteTarget");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1[5] + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    {
      objc_msgSend(*(id *)(a1[4] + 32), "activate");
      objc_msgSend(*(id *)(a1[4] + 32), "remoteTarget");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1[5] + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("UISApplicationStateClient.m"), 165, CFSTR("unable to create a remote target for %@"), 0x1E2CAFE60);

      }
    }
  }
}

- (UISApplicationStateClient)initWithBundleIdentifier:(id)a3
{
  id v6;
  UISApplicationStateClient *v7;
  UISApplicationStateClient *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  void *v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationStateClient.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v14.receiver = self;
  v14.super_class = (Class)UISApplicationStateClient;
  v7 = -[UISApplicationStateClient init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_bundleIdentifier, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.uikit.applicationStateClient", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

  }
  return v8;
}

- (void)setBadgeValue:(id)a3
{
  char isKindOfClass;
  int v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();
  v7 = v13;
  if (!v13 || (isKindOfClass & 1) != 0 || (v6 & 1) != 0)
  {
    if ((isKindOfClass & 1) == 0)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationStateClient.m"), 65, CFSTR("Badge must be nil, a NSNumber (integer), or a NSString *."));

    v7 = v13;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_8;
  }
  v8 = v7;
  if (objc_msgSend(v8, "integerValue") < 0)
  {

    v8 = &unk_1E2CBABC0;
  }
  -[UISApplicationStateClient _remoteTarget](self, "_remoteTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBadgeNumber:", v8);

  v7 = v13;
LABEL_8:
  if (((v7 != 0) & (v6 ^ 1)) == 0)
  {
    v10 = v7;
    if (!objc_msgSend(v10, "length"))
    {

      v10 = 0;
    }
    -[UISApplicationStateClient _remoteTarget](self, "_remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBadgeString:", v10);

    v7 = v13;
  }

}

- (NSString)badgeValue
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  -[UISApplicationStateClient _remoteTarget](self, "_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__UISApplicationStateClient_badgeValue__block_invoke;
  v5[3] = &unk_1E2CAF398;
  v5[4] = &v6;
  objc_msgSend(v2, "badgeValueWithCompletion:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)_remoteTarget
{
  NSObject *queue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  BSDispatchQueueAssertNot();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__UISApplicationStateClient__remoteTarget__block_invoke;
  block[3] = &unk_1E2CAF480;
  block[4] = self;
  block[5] = &v8;
  block[6] = a2;
  dispatch_sync(queue, block);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __42__UISApplicationStateClient__remoteTarget__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0x1E2CAFDE0);
}

void __39__UISApplicationStateClient_badgeValue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (!a2)
    a2 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __39__UISApplicationStateClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__UISApplicationStateClient_invalidate__block_invoke;
  block[3] = &unk_1E2CAF370;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_queue_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISApplicationStateClient.m"), 37, CFSTR("UISApplicationStateClient must be invalidated before deallocation."));

  }
  v5.receiver = self;
  v5.super_class = (Class)UISApplicationStateClient;
  -[UISApplicationStateClient dealloc](&v5, sel_dealloc);
}

- (BOOL)usesBackgroundNetwork
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[UISApplicationStateClient _remoteTarget](self, "_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__UISApplicationStateClient_usesBackgroundNetwork__block_invoke;
  v4[3] = &unk_1E2CAF3C0;
  v4[4] = &v5;
  objc_msgSend(v2, "usesBackgroundNetworkWithCompletion:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __50__UISApplicationStateClient_usesBackgroundNetwork__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setUsesBackgroundNetwork:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[UISApplicationStateClient _remoteTarget](self, "_remoteTarget");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsesBackgroundNetwork:", v4);

}

- (double)nextWakeIntervalSinceReferenceDate
{
  void *v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[UISApplicationStateClient _remoteTarget](self, "_remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__UISApplicationStateClient_nextWakeIntervalSinceReferenceDate__block_invoke;
  v5[3] = &unk_1E2CAF3C0;
  v5[4] = &v6;
  objc_msgSend(v2, "nextWakeIntervalSinceReferenceDateWithCompletion:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__UISApplicationStateClient_nextWakeIntervalSinceReferenceDate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "doubleValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

- (void)setNextWakeIntervalSinceReferenceDate:(double)a3
{
  void *v4;
  id v5;

  -[UISApplicationStateClient _remoteTarget](self, "_remoteTarget");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNextWakeIntervalSinceReferenceDate:", v4);

}

uint64_t __42__UISApplicationStateClient__remoteTarget__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activate");
}

void __42__UISApplicationStateClient__remoteTarget__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  objc_msgSend(a2, "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;

}

@end
