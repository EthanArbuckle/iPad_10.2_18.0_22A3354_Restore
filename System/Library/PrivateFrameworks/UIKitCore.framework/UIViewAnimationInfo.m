@implementation UIViewAnimationInfo

uint64_t __39__UIViewAnimationInfo_performWithLock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performWithLock:(id)a3
{
  id v4;
  NSObject *lockingQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  lockingQueue = self->_lockingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__UIViewAnimationInfo_performWithLock___block_invoke;
  block[3] = &unk_1E16B1BF8;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(lockingQueue, block);

}

- (void)setInvalidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIViewAnimationInfo)initWithView:(id)a3
{
  id v4;
  UIViewAnimationInfo *v5;
  UIViewAnimationInfo *v6;
  uint64_t v7;
  NSMutableDictionary *animatableProperties;
  uint64_t v9;
  NSMutableDictionary *modifierGroupRequestHandlers;
  uint64_t v11;
  NSMutableDictionary *presentationModifiers;
  uint64_t v13;
  NSMutableDictionary *isPartOfHigherOrderProperty;
  dispatch_queue_t v15;
  OS_dispatch_queue *lockingQueue;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIViewAnimationInfo;
  v5 = -[UIViewAnimationInfo init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owningView, v4);
    v7 = objc_opt_new();
    animatableProperties = v6->_animatableProperties;
    v6->_animatableProperties = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    modifierGroupRequestHandlers = v6->_modifierGroupRequestHandlers;
    v6->_modifierGroupRequestHandlers = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    presentationModifiers = v6->_presentationModifiers;
    v6->_presentationModifiers = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    isPartOfHigherOrderProperty = v6->_isPartOfHigherOrderProperty;
    v6->_isPartOfHigherOrderProperty = (NSMutableDictionary *)v13;

    v15 = dispatch_queue_create("com.apple.UIKit.DictionaryAccessQueue", MEMORY[0x1E0C80D50]);
    lockingQueue = v6->_lockingQueue;
    v6->_lockingQueue = (OS_dispatch_queue *)v15;

  }
  return v6;
}

- (void)_invalidateIfPossible
{
  void (**invalidationBlock)(void);
  id v4;

  if (-[UIViewAnimationInfo _canInvalidate](self, "_canInvalidate"))
  {
    invalidationBlock = (void (**)(void))self->_invalidationBlock;
    if (invalidationBlock)
    {
      invalidationBlock[2]();
      v4 = self->_invalidationBlock;
      self->_invalidationBlock = 0;

    }
  }
}

- (BOOL)_canInvalidate
{
  return !-[NSMutableDictionary count](self->_animatableProperties, "count")
      && !-[NSMutableDictionary count](self->_modifierGroupRequestHandlers, "count")
      && !-[NSMutableDictionary count](self->_presentationModifiers, "count")
      && -[NSMutableDictionary count](self->_isPartOfHigherOrderProperty, "count") == 0;
}

- (void)setPresentationModifier:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *presentationModifiers;

  presentationModifiers = self->_presentationModifiers;
  if (a3)
  {
    -[NSMutableDictionary setObject:forKey:](presentationModifiers, "setObject:forKey:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](presentationModifiers, "removeObjectForKey:", a4);
    -[UIViewAnimationInfo _invalidateIfPossible](self, "_invalidateIfPossible");
  }
}

- (id)presentationModifierForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_presentationModifiers, "objectForKey:", a3);
}

- (void)setModifierGroupRequestHandler:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *modifierGroupRequestHandlers;

  modifierGroupRequestHandlers = self->_modifierGroupRequestHandlers;
  if (a3)
  {
    -[NSMutableDictionary setObject:forKey:](modifierGroupRequestHandlers, "setObject:forKey:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](modifierGroupRequestHandlers, "removeObjectForKey:", a4);
    -[UIViewAnimationInfo _invalidateIfPossible](self, "_invalidateIfPossible");
  }
}

- (id)modifierGroupRequestHandlerForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_modifierGroupRequestHandlers, "objectForKey:", a3);
}

- (id)animatablePropertyKeys
{
  NSObject *lockingQueue;
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
  v9 = __Block_byref_object_copy__238;
  v10 = __Block_byref_object_dispose__238;
  v11 = 0;
  lockingQueue = self->_lockingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__UIViewAnimationInfo_animatablePropertyKeys__block_invoke;
  v5[3] = &unk_1E16BACE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockingQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __66__UIViewAnimationInfo_animatablePropertyForKey_createIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  UIAnimatableProperty *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  if (*(_BYTE *)(a1 + 56) && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v5 = [UIAnimatableProperty alloc];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__UIViewAnimationInfo_animatablePropertyForKey_createIfNecessary___block_invoke_2;
    v9[3] = &unk_1E16B1500;
    objc_copyWeak(&v11, &location);
    v10 = *(id *)(a1 + 40);
    v6 = -[UIAnimatableProperty initWithInvalidationCallback:](v5, "initWithInvalidationCallback:", v9);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setVelocityUsableForVFD:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&location);
}

- (id)animatablePropertyForKey:(id)a3 createIfNecessary:(BOOL)a4
{
  id v6;
  NSObject *lockingQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__238;
  v19 = __Block_byref_object_dispose__238;
  v20 = 0;
  lockingQueue = self->_lockingQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__UIViewAnimationInfo_animatablePropertyForKey_createIfNecessary___block_invoke;
  v11[3] = &unk_1E16EB6C0;
  v12 = v6;
  v13 = &v15;
  v11[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(lockingQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (NSMutableDictionary)isPartOfHigherOrderProperty
{
  return self->_isPartOfHigherOrderProperty;
}

uint64_t __52__UIViewAnimationInfo_setAnimatableProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  if (v2)
    return objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateIfPossible");
}

void __66__UIViewAnimationInfo_animatablePropertyForKey_createIfNecessary___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAnimatableProperty:forKey:", 0, *(_QWORD *)(a1 + 32));

}

- (void)setAnimatableProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *lockingQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  UIViewAnimationInfo *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  lockingQueue = self->_lockingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UIViewAnimationInfo_setAnimatableProperty_forKey___block_invoke;
  block[3] = &unk_1E16B47A8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_sync(lockingQueue, block);

}

- (UIView)owningView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_owningView);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockingQueue, 0);
  objc_storeStrong((id *)&self->_isPartOfHigherOrderProperty, 0);
  objc_storeStrong((id *)&self->_modifierGroupRequestHandlers, 0);
  objc_storeStrong((id *)&self->_presentationModifiers, 0);
  objc_storeStrong((id *)&self->_animatableProperties, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_destroyWeak((id *)&self->_owningView);
}

void __45__UIViewAnimationInfo_animatablePropertyKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setOwningView:(id)a3
{
  objc_storeWeak((id *)&self->_owningView, a3);
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (NSMutableDictionary)animatableProperties
{
  return self->_animatableProperties;
}

- (void)setAnimatableProperties:(id)a3
{
  objc_storeStrong((id *)&self->_animatableProperties, a3);
}

- (NSMutableDictionary)presentationModifiers
{
  return self->_presentationModifiers;
}

- (void)setPresentationModifiers:(id)a3
{
  objc_storeStrong((id *)&self->_presentationModifiers, a3);
}

- (NSMutableDictionary)modifierGroupRequestHandlers
{
  return self->_modifierGroupRequestHandlers;
}

- (void)setModifierGroupRequestHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_modifierGroupRequestHandlers, a3);
}

- (void)setIsPartOfHigherOrderProperty:(id)a3
{
  objc_storeStrong((id *)&self->_isPartOfHigherOrderProperty, a3);
}

- (OS_dispatch_queue)lockingQueue
{
  return self->_lockingQueue;
}

- (void)setLockingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lockingQueue, a3);
}

@end
