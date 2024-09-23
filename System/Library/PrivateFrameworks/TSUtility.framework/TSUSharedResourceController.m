@implementation TSUSharedResourceController

- (TSUSharedResourceController)init
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSharedResourceController init]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 54, CFSTR("Do not call method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSUSharedResourceController init]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (TSUSharedResourceController)initWithName:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TSUSharedResourceController *v11;
  TSUSharedResourceController *v12;
  void *v13;
  uint64_t v14;
  NSString *UUID;
  uint64_t v16;
  NSString *resourceForThreadKey;
  uint64_t v18;
  NSString *hasResourceForThreadKey;
  NSCondition *v20;
  NSCondition *resourceLock;
  char v22;
  NSCondition *v23;
  NSCondition *waitLock;
  dispatch_group_t v25;
  OS_dispatch_group *accessInProgressGroup;
  dispatch_group_t v27;
  OS_dispatch_group *willEndAccessGroup;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSharedResourceController initWithName:delegate:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 59, CFSTR("invalid nil value for '%s'"), "delegate");

  }
  v30.receiver = self;
  v30.super_class = (Class)TSUSharedResourceController;
  v11 = -[TSUSharedResourceController init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v7);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    UUID = v12->_UUID;
    v12->_UUID = (NSString *)v14;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TSUSharedResourceController.Resource.%@"), v12->_UUID);
    v16 = objc_claimAutoreleasedReturnValue();
    resourceForThreadKey = v12->_resourceForThreadKey;
    v12->_resourceForThreadKey = (NSString *)v16;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TSUSharedResourceController.HasResource.%@"), v12->_UUID);
    v18 = objc_claimAutoreleasedReturnValue();
    hasResourceForThreadKey = v12->_hasResourceForThreadKey;
    v12->_hasResourceForThreadKey = (NSString *)v18;

    v20 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    resourceLock = v12->_resourceLock;
    v12->_resourceLock = v20;

    -[NSCondition setName:](v12->_resourceLock, "setName:", v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v7, "acquiresResourceAsynchronouslyForSharedResourceController:", v12))
        v22 = 2;
      else
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    *(_BYTE *)&v12->_flags = *(_BYTE *)&v12->_flags & 0xFD | v22;
    v23 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    waitLock = v12->_waitLock;
    v12->_waitLock = v23;

    v25 = dispatch_group_create();
    accessInProgressGroup = v12->_accessInProgressGroup;
    v12->_accessInProgressGroup = (OS_dispatch_group *)v25;

    v27 = dispatch_group_create();
    willEndAccessGroup = v12->_willEndAccessGroup;
    v12->_willEndAccessGroup = (OS_dispatch_group *)v27;

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  if (self->_acquirerCount)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSharedResourceController dealloc]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 84, CFSTR("Unbalanced calls to |-didBeginAccessToResource:| and |-willEndAccessToResource|"));

  }
  if (self->_threadsAcquiringResourceCount)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSharedResourceController dealloc]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 85, CFSTR("Unbalanced increments and decrements of number of threads acquiring the resource."));

  }
  v9.receiver = self;
  v9.super_class = (Class)TSUSharedResourceController;
  -[TSUSharedResourceController dealloc](&v9, sel_dealloc);
}

- (BOOL)canWaitOnMainThread
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)setCanWaitOnMainThread:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (void)didBeginAccessToResource:(id)a3
{
  -[TSUSharedResourceController didBeginAccessToResource:isFromThreadWaitingToAcquireResource:](self, "didBeginAccessToResource:isFromThreadWaitingToAcquireResource:", a3, 0);
}

- (void)didBeginAccessToResource:(id)a3 isFromThreadWaitingToAcquireResource:(BOOL)a4
{
  _BOOL4 v4;
  int *p_acquirerCount;
  unsigned int v8;
  id resource;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int threadsAcquiringResourceCount;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a4;
  v19 = a3;
  -[NSCondition lock](self->_resourceLock, "lock");
  p_acquirerCount = &self->_acquirerCount;
  do
    v8 = __ldaxr((unsigned int *)p_acquirerCount);
  while (__stlxr(v8 + 1, (unsigned int *)p_acquirerCount));
  if (v8)
  {
    resource = self->_resource;
    v10 = resource == v19 || resource == 0;
    if (!v10 && (objc_msgSend(resource, "isEqual:", v19) & 1) == 0)
    {
      +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSharedResourceController didBeginAccessToResource:isFromThreadWaitingToAcquireResource:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCondition name](self->_resourceLock, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 108, CFSTR("%@ changed during coordinated access: current (%@), new (%@)"), v14, self->_resource, v19);

    }
  }
  objc_storeStrong(&self->_resource, a3);
  *(_BYTE *)&self->_flags |= 4u;
  if (v4)
  {
    threadsAcquiringResourceCount = self->_threadsAcquiringResourceCount;
    self->_threadsAcquiringResourceCount = threadsAcquiringResourceCount - 1;
    if (threadsAcquiringResourceCount <= 0)
    {
      +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSharedResourceController didBeginAccessToResource:isFromThreadWaitingToAcquireResource:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 116, CFSTR("Unbalanced increments and decrements of number of threads acquiring the resource."));

    }
  }
  __dmb(0xBu);
  -[NSCondition broadcast](self->_resourceLock, "broadcast");
  -[NSCondition unlock](self->_resourceLock, "unlock");

}

- (void)wakeUpAllThreadsWaitingForResourceWithLock
{
  int waitCount;

  -[NSCondition lock](self->_waitLock, "lock");
  if (self->_waitCount < 1)
  {
LABEL_4:
    -[NSCondition unlock](self->_waitLock, "unlock");
  }
  else
  {
    while (1)
    {
      -[NSCondition broadcast](self->_resourceLock, "broadcast");
      -[NSCondition unlock](self->_resourceLock, "unlock");
      -[NSCondition wait](self->_waitLock, "wait");
      waitCount = self->_waitCount;
      -[NSCondition unlock](self->_waitLock, "unlock");
      -[NSCondition lock](self->_resourceLock, "lock");
      if (waitCount < 1)
        break;
      -[NSCondition lock](self->_waitLock, "lock");
      if (self->_waitCount <= 0)
        goto LABEL_4;
    }
  }
}

- (void)willEndAccessToResource
{
  -[TSUSharedResourceController willEndAccessToResourceForcingToWaitForPendingAccesses:](self, "willEndAccessToResourceForcingToWaitForPendingAccesses:", 0);
}

- (void)willEndAccessToResourceForcingToWaitForPendingAccesses:(BOOL)a3
{
  int *p_acquirerCount;
  int v5;
  id resource;
  void *v8;
  void *v9;
  id v10;

  p_acquirerCount = &self->_acquirerCount;
  do
    v5 = __ldaxr((unsigned int *)p_acquirerCount);
  while (__stlxr(v5 - 1, (unsigned int *)p_acquirerCount));
  if (v5 != 1 && !a3)
  {
    if (v5 <= 0)
    {
      +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSharedResourceController willEndAccessToResourceForcingToWaitForPendingAccesses:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 195, CFSTR("Unbalanced calls to |-didBeginAccessToResource:| and |-willEndAccessToResource|"));

    }
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_willEndAccessGroup);
    -[NSCondition lock](self->_resourceLock, "lock");
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      -[TSUSharedResourceController wakeUpAllThreadsWaitingForResourceWithLock](self, "wakeUpAllThreadsWaitingForResourceWithLock");
    resource = self->_resource;
    self->_resource = 0;

    *(_BYTE *)&self->_flags &= ~4u;
    __dmb(0xBu);
    -[NSCondition unlock](self->_resourceLock, "unlock");
    dispatch_group_wait((dispatch_group_t)self->_accessInProgressGroup, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_group_leave((dispatch_group_t)self->_willEndAccessGroup);
  }
}

- (void)performSynchronousAccessUsingBlock:(id)a3
{
  -[TSUSharedResourceController performSynchronousAccessIfResourceIsAvailable:usingBlock:](self, "performSynchronousAccessIfResourceIsAvailable:usingBlock:", 0, a3);
}

- (BOOL)performSynchronousAccessIfResourceIsAvailableUsingBlock:(id)a3
{
  return -[TSUSharedResourceController performSynchronousAccessIfResourceIsAvailable:usingBlock:](self, "performSynchronousAccessIfResourceIsAvailable:usingBlock:", 1, a3);
}

- (BOOL)performSynchronousAccessIfResourceIsAvailable:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _BOOL4 v12;
  void (**v13)(void *, id);
  id v14;
  $B78C53DA64D405E895D3E1BDADA0F7B1 flags;
  int v16;
  _QWORD aBlock[4];
  id v19;
  TSUSharedResourceController *v20;
  id v21;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "threadDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", self->_hasResourceForThreadKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (!v10)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__TSUSharedResourceController_performSynchronousAccessIfResourceIsAvailable_usingBlock___block_invoke;
    aBlock[3] = &unk_24D61B9C0;
    v19 = v8;
    v20 = self;
    v21 = v6;
    v13 = (void (**)(void *, id))_Block_copy(aBlock);
    dispatch_group_wait((dispatch_group_t)self->_willEndAccessGroup, 0xFFFFFFFFFFFFFFFFLL);
    -[NSCondition lock](self->_resourceLock, "lock");
    dispatch_group_enter((dispatch_group_t)self->_accessInProgressGroup);
    v14 = self->_resource;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) != 0 || v4)
    {
      v12 = (*(unsigned int *)&flags >> 2) & 1;
      -[NSCondition unlock](self->_resourceLock, "unlock");
      if ((*(_BYTE *)&flags & 4) != 0)
        v13[2](v13, v14);
      dispatch_group_leave((dispatch_group_t)self->_accessInProgressGroup);
      goto LABEL_16;
    }
    if (self->_threadsAcquiringResourceCount)
    {
      if ((*(_BYTE *)&flags & 1) != 0 || !objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        -[NSCondition lock](self->_waitLock, "lock");
        ++self->_waitCount;
        __dmb(0xBu);
        -[NSCondition unlock](self->_waitLock, "unlock");
        -[TSUSharedResourceController waitForResourceWithLockAndPerformSynchronousAccessUsingBlock:](self, "waitForResourceWithLockAndPerformSynchronousAccessUsingBlock:", v13);
LABEL_15:
        LOBYTE(v12) = 1;
LABEL_16:

        goto LABEL_17;
      }
      v16 = self->_threadsAcquiringResourceCount + 1;
    }
    else
    {
      v16 = 1;
    }
    self->_threadsAcquiringResourceCount = v16;
    __dmb(0xBu);
    -[TSUSharedResourceController acquireResourceWithLockAndPerformSynchronousAccessUsingBlock:](self, "acquireResourceWithLockAndPerformSynchronousAccessUsingBlock:", v13);
    goto LABEL_15;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", self->_resourceForThreadKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v6 + 2))(v6, v11);

  LOBYTE(v12) = 1;
LABEL_17:

  return v12;
}

uint64_t __88__TSUSharedResourceController_performSynchronousAccessIfResourceIsAvailable_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  v5 = a2;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v4);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(v7 + 24));
  else
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(v7 + 24));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

- (void)acquireResourceWithLockAndPerformSynchronousAccessUsingBlock:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  void (*v12)(_QWORD *, _QWORD *);
  NSObject *v13;
  _QWORD v14[4];
  dispatch_semaphore_t v15;
  _QWORD aBlock[4];
  id v17;
  TSUSharedResourceController *v18;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSharedResourceController acquireResourceWithLockAndPerformSynchronousAccessUsingBlock:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 293, CFSTR("invalid nil value for '%s'"), "delegate");

  }
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke;
  aBlock[3] = &unk_24D61BA10;
  v10 = WeakRetained;
  v17 = v10;
  v18 = self;
  v11 = _Block_copy(aBlock);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    -[NSCondition lock](self->_waitLock, "lock");
    ++self->_waitCount;
    __dmb(0xBu);
    -[NSCondition unlock](self->_waitLock, "unlock");
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke_3;
    v14[3] = &unk_24D61BA38;
    v15 = dispatch_semaphore_create(0);
    v12 = (void (*)(_QWORD *, _QWORD *))v11[2];
    v13 = v15;
    v12(v11, v14);
    -[TSUSharedResourceController waitForResourceWithLockAndPerformSynchronousAccessUsingBlock:](self, "waitForResourceWithLockAndPerformSynchronousAccessUsingBlock:", v4);
    dispatch_semaphore_signal(v13);

  }
  else
  {
    -[NSCondition unlock](self->_resourceLock, "unlock");
    dispatch_group_leave((dispatch_group_t)self->_accessInProgressGroup);
    ((void (*)(_QWORD *, id))v11[2])(v11, v4);
  }

}

void __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke_2;
  v7[3] = &unk_24D61B9E8;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "acquireResourceForSharedResourceController:usingSetResourceBlock:", v4, v7);

}

uint64_t __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "didBeginAccessToResource:isFromThreadWaitingToAcquireResource:", v4, 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return objc_msgSend(*(id *)(a1 + 32), "willEndAccessToResource");
}

intptr_t __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)waitForResourceWithLockAndPerformSynchronousAccessUsingBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void (**v7)(id, id);

  v7 = (void (**)(id, id))a3;
  v4 = 0;
  do
  {
    v5 = v4;
    dispatch_group_leave((dispatch_group_t)self->_accessInProgressGroup);
    -[NSCondition wait](self->_resourceLock, "wait");
    dispatch_group_enter((dispatch_group_t)self->_accessInProgressGroup);
    v4 = self->_resource;

  }
  while ((*(_BYTE *)&self->_flags & 4) == 0);
  -[NSCondition lock](self->_waitLock, "lock");
  v6 = self->_waitCount - 1;
  self->_waitCount = v6;
  __dmb(0xBu);
  if (!v6)
    -[NSCondition broadcast](self->_waitLock, "broadcast");
  -[NSCondition unlock](self->_waitLock, "unlock");
  -[NSCondition unlock](self->_resourceLock, "unlock");
  v7[2](v7, v4);
  dispatch_group_leave((dispatch_group_t)self->_accessInProgressGroup);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TSUSharedResourceController;
  -[TSUSharedResourceController description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCondition name](self->_resourceLock, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \"%@\"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_willEndAccessGroup, 0);
  objc_storeStrong((id *)&self->_accessInProgressGroup, 0);
  objc_storeStrong((id *)&self->_waitLock, 0);
  objc_storeStrong(&self->_resource, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_hasResourceForThreadKey, 0);
  objc_storeStrong((id *)&self->_resourceForThreadKey, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
