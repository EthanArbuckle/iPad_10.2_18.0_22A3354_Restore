@implementation PKNotifyRegistration

- (id)subregisterWithHandler:(id)a3
{
  id v4;
  PKNotifySubregistration *v5;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated || !self->_subregistrations)
  {
    v5 = 0;
  }
  else
  {
    v5 = -[PKNotifySubregistration initWithParent:handler:]([PKNotifySubregistration alloc], "initWithParent:handler:", self, v4);
    -[NSMutableArray addObject:](self->_subregistrations, "addObject:", v5);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (PKNotifyRegistration)initWithName:(id)a3
{
  id v4;
  PKNotifyRegistration *v5;
  PKNotifyRegistration *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSString *name;
  NSMutableArray *v13;
  NSMutableArray *subregistrations;
  PKNotifyRegistration *v15;
  void *v16;
  id v17;
  uint32_t v18;
  NSObject *p_super;
  _BOOL4 v20;
  _QWORD aBlock[4];
  PKNotifyRegistration *v23;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint32_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKNotifyRegistration;
  v5 = -[PKNotifyRegistration init](&v24, sel_init);
  if (v5)
  {
    v6 = v5;
    v5->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.passkitcore.pknotifycoalescer", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(v4, "copy");
    name = v6->_name;
    v6->_name = (NSString *)v11;

    v6->_token = -1;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subregistrations = v6->_subregistrations;
    v6->_subregistrations = v13;

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__PKNotifyRegistration_initWithName___block_invoke;
    aBlock[3] = &unk_1E2AC9C48;
    v15 = v6;
    v23 = v15;
    v16 = _Block_copy(aBlock);
    v17 = objc_retainAutorelease(v4);
    v18 = notify_register_dispatch((const char *)objc_msgSend(v17, "UTF8String"), &v6->_token, (dispatch_queue_t)v6->_queue, v16);
    PKLogFacilityTypeGetObject(0);
    p_super = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138543618;
        v26 = v17;
        v27 = 1024;
        v28 = v18;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "PKNotifyCoalescer: failed to register for notification %{public}@ with status %u.", buf, 0x12u);
      }

      -[PKNotifyRegistration invalidate](v15, "invalidate");
      p_super = &v15->super;
      v15 = 0;
    }
    else if (v20)
    {
      *(_DWORD *)buf = 138543362;
      v26 = v17;
      _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "PKNotifyCoalescer: registered for notification %{public}@.", buf, 0xCu);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)removeInvalidatedSubregistration:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *subregistrations;
  uint64_t v7;
  void *v8;
  void *v9;
  PKNotifyRegistration *v10;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray removeObjectIdenticalTo:](self->_subregistrations, "removeObjectIdenticalTo:", v5);

  subregistrations = self->_subregistrations;
  if (subregistrations)
  {
    v7 = -[NSMutableArray count](subregistrations, "count");
    os_unfair_lock_unlock(p_lock);
    if (v7)
      return;
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  v10 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_221);
  if (!-[PKNotifyRegistration hasSubregistrations](v10, "hasSubregistrations"))
  {
    v8 = (void *)qword_1ECF22470;
    -[PKNotifyRegistration name](v10, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v9);

    -[PKNotifyRegistration invalidate](v10, "invalidate");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_221);

}

- (NSString)name
{
  return self->_name;
}

- (BOOL)hasSubregistrations
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *subregistrations;
  BOOL v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  subregistrations = self->_subregistrations;
  if (subregistrations)
    v5 = -[NSMutableArray count](subregistrations, "count") != 0;
  else
    v5 = 0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PKNotifyRegistration invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKNotifyRegistration;
  -[PKNotifyRegistration dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  NSString *name;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *subregistrations;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_token != -1)
    {
      PKLogFacilityTypeGetObject(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        *(_DWORD *)buf = 138543362;
        v18 = name;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKNotifyCoalescer: unregistered for notification %{public}@.", buf, 0xCu);
      }

      notify_cancel(self->_token);
      self->_token = -1;
    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_subregistrations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "_invalidateFromParent:", 1, (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    subregistrations = self->_subregistrations;
    self->_subregistrations = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_subregistrations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (PKNotifyRegistration)init
{

  return 0;
}

void __37__PKNotifyRegistration_initWithName___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  else
    v2 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invokeHandler", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

@end
