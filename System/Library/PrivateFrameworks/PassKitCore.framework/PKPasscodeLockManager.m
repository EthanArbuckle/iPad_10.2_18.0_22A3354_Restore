@implementation PKPasscodeLockManager

+ (id)sharedManager
{
  if (_MergedGlobals_263 != -1)
    dispatch_once(&_MergedGlobals_263, &__block_literal_global_169);
  return (id)qword_1ECF22A08;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

void __38__PKPasscodeLockManager_sharedManager__block_invoke()
{
  PKPasscodeLockManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKPasscodeLockManager);
  v1 = (void *)qword_1ECF22A08;
  qword_1ECF22A08 = (uint64_t)v0;

}

- (PKPasscodeLockManager)init
{
  PKPasscodeLockManager *v2;
  uint64_t v3;
  MCProfileConnection *profileConnection;
  uint64_t v5;
  NSHashTable *observers;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *replyQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPasscodeLockManager;
  v2 = -[PKPasscodeLockManager init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = (MCProfileConnection *)v3;

    -[MCProfileConnection registerObserver:](v2->_profileConnection, "registerObserver:", v2);
    v2->_isPasscodeSet = -[MCProfileConnection isPasscodeSet](v2->_profileConnection, "isPasscodeSet");
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.passkit.passcodelockmanager.replyQueue", v7);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MCProfileConnection unregisterObserver:](self->_profileConnection, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPasscodeLockManager;
  -[PKPasscodeLockManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isPasscodeSet
{
  PKPasscodeLockManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isPasscodeSet;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)profileConnectionDidReceivePasscodeChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  char v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  NSObject *replyQueue;
  id v13;
  _QWORD block[4];
  id v15;
  PKPasscodeLockManager *v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isPasscodeSet");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isPasscodeSet = v8;
  if (-[NSHashTable count](self->_observers, "count"))
  {
    v10 = (void *)MEMORY[0x19400CFE8]();
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__PKPasscodeLockManager_profileConnectionDidReceivePasscodeChangedNotification_userInfo___block_invoke;
    block[3] = &unk_1E2AC2F58;
    v15 = v11;
    v16 = self;
    v17 = v8;
    v13 = v11;
    dispatch_async(replyQueue, block);

    objc_autoreleasePoolPop(v10);
  }
  os_unfair_lock_unlock(p_lock);

}

uint64_t __89__PKPasscodeLockManager_profileConnectionDidReceivePasscodeChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89__PKPasscodeLockManager_profileConnectionDidReceivePasscodeChangedNotification_userInfo___block_invoke_2;
  v3[3] = &unk_1E2AD6D78;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __89__PKPasscodeLockManager_profileConnectionDidReceivePasscodeChangedNotification_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passcodeLockManager:didReceivePasscodeSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
}

@end
