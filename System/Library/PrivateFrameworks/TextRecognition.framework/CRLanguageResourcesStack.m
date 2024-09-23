@implementation CRLanguageResourcesStack

- (CRLanguageResourcesStack)initWithLocaleIdentifier:(id)a3 resourceType:(int64_t)a4
{
  id v6;
  CRLanguageResourcesStack *v7;
  CRLanguageResourcesStack *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLanguageResourcesStack;
  v7 = -[CRLanguageResourcesStack init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CRLanguageResourcesStack setLocaleIdentifier:](v7, "setLocaleIdentifier:", v6);
    v9 = (void *)objc_opt_new();
    -[CRLanguageResourcesStack setAvailableResources:](v8, "setAvailableResources:", v9);

    -[CRLanguageResourcesStack setTotalResources:](v8, "setTotalResources:", 0);
    v10 = dispatch_semaphore_create(0);
    -[CRLanguageResourcesStack setResourceCountSemaphore:](v8, "setResourceCountSemaphore:", v10);

    v11 = (void *)objc_opt_new();
    -[CRLanguageResourcesStack setSubscribers:](v8, "setSubscribers:", v11);

    -[CRLanguageResourcesStack setResourceType:](v8, "setResourceType:", a4);
    v12 = (void *)objc_opt_new();
    -[CRLanguageResourcesStack setActiveSubscribers:](v8, "setActiveSubscribers:", v12);

  }
  return v8;
}

- (id)popResourceForSubscriber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CRLanguageResources *v11;
  void *v12;
  CRLanguageResources *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  CRLanguageResources *v18;

  v4 = a3;
  -[CRLanguageResourcesStack activeSubscribers](self, "activeSubscribers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[CRLanguageResourcesStack activeSubscribers](self, "activeSubscribers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_sync_exit(v5);
  -[CRLanguageResourcesStack availableResources](self, "availableResources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  -[CRLanguageResourcesStack availableResources](self, "availableResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {

  }
  else
  {
    v10 = -[CRLanguageResourcesStack totalResources](self, "totalResources");

    if (v10 <= 3)
    {
      v11 = [CRLanguageResources alloc];
      -[CRLanguageResourcesStack localeIdentifier](self, "localeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CRLanguageResources initWithLanguageIdentifier:type:](v11, "initWithLanguageIdentifier:type:", v12, -[CRLanguageResourcesStack resourceType](self, "resourceType"));

      -[CRLanguageResourcesStack setTotalResources:](self, "setTotalResources:", -[CRLanguageResourcesStack totalResources](self, "totalResources") + 1);
      goto LABEL_6;
    }
  }
  v13 = 0;
LABEL_6:
  objc_sync_exit(v8);

  if (!v13)
  {
    -[CRLanguageResourcesStack resourceCountSemaphore](self, "resourceCountSemaphore");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

    -[CRLanguageResourcesStack availableResources](self, "availableResources");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v15);
    -[CRLanguageResourcesStack availableResources](self, "availableResources");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v13 = (CRLanguageResources *)objc_claimAutoreleasedReturnValue();

    -[CRLanguageResourcesStack availableResources](self, "availableResources");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeLastObject");

    objc_sync_exit(v15);
  }
  v18 = v13;

  return v18;
}

- (void)pushResource:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  -[CRLanguageResourcesStack availableResources](self, "availableResources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[CRLanguageResourcesStack availableResources](self, "availableResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  -[CRLanguageResourcesStack resourceCountSemaphore](self, "resourceCountSemaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

  objc_sync_exit(v4);
}

- (void)addSubscriber:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CRLanguageResourcesStack subscribers](self, "subscribers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[CRLanguageResourcesStack subscribers](self, "subscribers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
  -[CRLanguageResourcesStack activeSubscribers](self, "activeSubscribers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[CRLanguageResourcesStack activeSubscribers](self, "activeSubscribers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  objc_sync_exit(v7);
}

- (void)removeSubscriber:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CRLanguageResourcesStack subscribers](self, "subscribers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[CRLanguageResourcesStack subscribers](self, "subscribers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
  -[CRLanguageResourcesStack activeSubscribers](self, "activeSubscribers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[CRLanguageResourcesStack activeSubscribers](self, "activeSubscribers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v9);

  objc_sync_exit(v7);
}

- (void)deactivateSubscriber:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  id v15;

  v15 = a3;
  -[CRLanguageResourcesStack activeSubscribers](self, "activeSubscribers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[CRLanguageResourcesStack activeSubscribers](self, "activeSubscribers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  -[CRLanguageResourcesStack activeSubscribers](self, "activeSubscribers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    -[CRLanguageResourcesStack availableResources](self, "availableResources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v9);
    -[CRLanguageResourcesStack availableResources](self, "availableResources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 >= 2)
    {
      -[CRLanguageResourcesStack availableResources](self, "availableResources");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRLanguageResourcesStack availableResources](self, "availableResources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectsInRange:", 1, objc_msgSend(v13, "count") - 1);

      -[CRLanguageResourcesStack setTotalResources:](self, "setTotalResources:", 1);
      v14 = dispatch_semaphore_create(1);
      -[CRLanguageResourcesStack setResourceCountSemaphore:](self, "setResourceCountSemaphore:", v14);

    }
    objc_sync_exit(v9);

  }
  objc_sync_exit(v4);

}

- (BOOL)hasSubscriber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[CRLanguageResourcesStack subscribers](self, "subscribers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[CRLanguageResourcesStack subscribers](self, "subscribers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  objc_sync_exit(v5);
  return v8;
}

- (int64_t)subscriberCount
{
  void *v2;
  int64_t v3;

  -[CRLanguageResourcesStack subscribers](self, "subscribers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)totalResources
{
  return self->_totalResources;
}

- (void)setTotalResources:(int64_t)a3
{
  self->_totalResources = a3;
}

- (NSMutableArray)availableResources
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAvailableResources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)localeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_semaphore)resourceCountSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResourceCountSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)subscribers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubscribers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(int64_t)a3
{
  self->_resourceType = a3;
}

- (NSMutableSet)activeSubscribers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setActiveSubscribers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSubscribers, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_resourceCountSemaphore, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_availableResources, 0);
}

@end
