@implementation PVEffectTimedPropertiesComponent

- (PVEffectTimedPropertiesComponent)initWithEffect:(id)a3
{
  id v4;
  id v5;
  id *v6;
  uint64_t v7;
  void *v8;
  id *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PVEffectTimedPropertiesComponent;
  v5 = -[PVEffectComponent initWithEffect:](&v11, sel_initWithEffect_, v4);
  if (v5)
  {
    v6 = (id *)operator new();
    *v6 = dispatch_queue_create("com.apple.PVEffect.TimedPropertiesDelegatesLock", 0);
    v10 = 0;
    std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)v5 + 3, v6);
    std::unique_ptr<PVGCDLock>::reset[abi:ne180100](&v10, 0);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v7;

  }
  return (PVEffectTimedPropertiesComponent *)v5;
}

- (void)addTimedPropertiesDelegateWrapper:(id)a3
{
  id v4;
  PVGCDLock *value;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    value = self->_delegateCollectionLock.__ptr_.__value_;
    block[1] = 3221225472;
    block[2] = __70__PVEffectTimedPropertiesComponent_addTimedPropertiesDelegateWrapper___block_invoke;
    block[3] = &unk_1E64D47E8;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(*(dispatch_queue_t *)value, block);

    v4 = v6;
  }

}

uint64_t __70__PVEffectTimedPropertiesComponent_addTimedPropertiesDelegateWrapper___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)applyTimedPropertiesForTime:(id *)a3
{
  void *v5;
  _QWORD v7[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[PVEffectComponent effect](self, "effect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PVEffectTimedPropertiesComponent_applyTimedPropertiesForTime___block_invoke;
  v7[3] = &unk_1E64D8A20;
  v7[4] = self;
  v7[5] = &v9;
  v8 = *a3;
  objc_msgSend(v5, "runWithInspectableProperties:", v7);

  LOBYTE(v5) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v5;
}

void __64__PVEffectTimedPropertiesComponent_applyTimedPropertiesForTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  uint64_t v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "addTimedPropertiesToDict:time:", v3, &v5);

}

- (void)addTimedPropertiesDelegate:(id)a3 userContext:(id)a4
{
  id v6;
  PVEffectTimedPropertiesDelegateWrapper *v7;
  void *v8;
  void *v9;
  PVEffectTimedPropertiesDelegateWrapper *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = [PVEffectTimedPropertiesDelegateWrapper alloc];
  -[PVEffectComponent effect](self, "effect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "supportedTimedPropertyGroupsForEffect:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PVEffectTimedPropertiesDelegateWrapper initWithTimedPropertiesDelegate:supportedTimedPropertyGroups:userContext:](v7, "initWithTimedPropertiesDelegate:supportedTimedPropertyGroups:userContext:", v11, v9, v6);

  -[PVEffectTimedPropertiesComponent addTimedPropertiesDelegateWrapper:](self, "addTimedPropertiesDelegateWrapper:", v10);
}

- (void)removeTimedPropertiesDelegate:(id)a3
{
  id v4;
  PVGCDLock *value;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PVEffectTimedPropertiesComponent_removeTimedPropertiesDelegate___block_invoke;
  block[3] = &unk_1E64D47E8;
  block[4] = self;
  v9 = v4;
  v6 = *(NSObject **)value;
  v7 = v4;
  dispatch_sync(v6, block);

}

uint64_t __66__PVEffectTimedPropertiesComponent_removeTimedPropertiesDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllTimedPropertiesDelegates
{
  PVGCDLock *value;
  _QWORD block[5];

  value = self->_delegateCollectionLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PVEffectTimedPropertiesComponent_removeAllTimedPropertiesDelegates__block_invoke;
  block[3] = &unk_1E64D47C0;
  block[4] = self;
  dispatch_sync(*(dispatch_queue_t *)value, block);
}

uint64_t __69__PVEffectTimedPropertiesComponent_removeAllTimedPropertiesDelegates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (id)delegateWrappers
{
  PVGCDLock *value;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PVEffectTimedPropertiesComponent_delegateWrappers__block_invoke;
  v5[3] = &unk_1E64D5490;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(*(dispatch_queue_t *)value, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__PVEffectTimedPropertiesComponent_delegateWrappers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)timedPropertiesDelegates
{
  PVGCDLock *value;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PVEffectTimedPropertiesComponent_timedPropertiesDelegates__block_invoke;
  v5[3] = &unk_1E64D6458;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(*(dispatch_queue_t *)value, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __60__PVEffectTimedPropertiesComponent_timedPropertiesDelegates__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__PVEffectTimedPropertiesComponent_timedPropertiesDelegates__block_invoke_2;
    v9[3] = &unk_1E64D8A48;
    v5 = v3;
    v10 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
    v8 = v5;

  }
}

void __60__PVEffectTimedPropertiesComponent_timedPropertiesDelegates__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;

  v4 = (void *)MEMORY[0x1B5E29C50]();
  objc_msgSend(a2, "timedPropertiesDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  objc_autoreleasePoolPop(v4);
}

- (BOOL)hasTimedPropertiesDelegates
{
  PVGCDLock *value;
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
  value = self->_delegateCollectionLock.__ptr_.__value_;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegates__block_invoke;
  v5[3] = &unk_1E64D6458;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(*(dispatch_queue_t *)value, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegates__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegates__block_invoke_2;
  v4[3] = &unk_1E64D8A70;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

void __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegates__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;

  objc_msgSend(a2, "timedPropertiesDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (BOOL)hasTimedPropertiesDelegate:(id)a3
{
  id v4;
  PVGCDLock *value;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegate___block_invoke;
  block[3] = &unk_1E64D8760;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = *(NSObject **)value;
  v7 = v4;
  dispatch_sync(v6, block);
  LOBYTE(v6) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v6;
}

uint64_t __63__PVEffectTimedPropertiesComponent_hasTimedPropertiesDelegate___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)userContextForTimedPropertiesDelegate:(id)a3
{
  id v4;
  PVGCDLock *value;
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
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  v18 = 0;
  value = self->_delegateCollectionLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PVEffectTimedPropertiesComponent_userContextForTimedPropertiesDelegate___block_invoke;
  block[3] = &unk_1E64D8760;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v6 = *(NSObject **)value;
  v7 = v4;
  dispatch_sync(v6, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __74__PVEffectTimedPropertiesComponent_userContextForTimedPropertiesDelegate___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 16), "member:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)addTimedPropertiesToDict:(id)a3 time:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[PVEffectComponent effect](self, "effect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectTimedPropertiesComponent delegateWrappers](self, "delegateWrappers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PVEffectTimedPropertiesComponent_addTimedPropertiesToDict_time___block_invoke;
  v12[3] = &unk_1E64D8AC0;
  v9 = v7;
  v16 = *a4;
  v13 = v9;
  v15 = &v17;
  v10 = v6;
  v14 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  LOBYTE(v6) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v6;
}

void __66__PVEffectTimedPropertiesComponent_addTimedPropertiesToDict_time___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v8 = a2;
  v3 = (void *)MEMORY[0x1B5E29C50]();
  objc_msgSend(v8, "timedPropertiesDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v8, "supportedTimedPropertyGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__PVEffectTimedPropertiesComponent_addTimedPropertiesToDict_time___block_invoke_2;
    v9[3] = &unk_1E64D8A98;
    v10 = v4;
    v11 = *(id *)(a1 + 32);
    v14 = *(_OWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 72);
    v12 = v8;
    v7 = *(_OWORD *)(a1 + 40);
    v6 = (id)v7;
    v13 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  }
  objc_autoreleasePoolPop(v3);

}

void __66__PVEffectTimedPropertiesComponent_addTimedPropertiesToDict_time___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1B5E29C50]();
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "userContext", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effect:timedPropertiesForGroup:time:userContext:", v6, v3, &v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 56), "addEntriesFromDictionary:", v8);
  }

  objc_autoreleasePoolPop(v4);
}

- (void)effectDidLoad:(id)a3 isReady:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  -[PVEffectTimedPropertiesComponent delegateWrappers](self, "delegateWrappers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PVEffectTimedPropertiesComponent_effectDidLoad_isReady___block_invoke;
  v8[3] = &unk_1E64D8A48;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __58__PVEffectTimedPropertiesComponent_effectDidLoad_isReady___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)MEMORY[0x1B5E29C50]();
  objc_msgSend(v7, "timedPropertiesDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v7, "wantsStartStopNotifications"))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "userContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effect:willStartRequestingTimedProperties:", v5, v6);

  }
  objc_autoreleasePoolPop(v3);

}

- (void)effectDidUnload:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PVEffectTimedPropertiesComponent delegateWrappers](self, "delegateWrappers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PVEffectTimedPropertiesComponent_effectDidUnload___block_invoke;
  v7[3] = &unk_1E64D8A48;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __52__PVEffectTimedPropertiesComponent_effectDidUnload___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)MEMORY[0x1B5E29C50]();
  objc_msgSend(v7, "timedPropertiesDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v7, "wantsStartStopNotifications"))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "userContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effect:didStopRequestingTimedProperties:", v5, v6);

  }
  objc_autoreleasePoolPop(v3);

}

- (void).cxx_destruct
{
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_delegateCollectionLock, 0);
  objc_storeStrong((id *)&self->_delegateWrappers, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
