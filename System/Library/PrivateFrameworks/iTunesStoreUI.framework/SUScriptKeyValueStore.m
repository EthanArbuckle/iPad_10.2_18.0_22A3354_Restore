@implementation SUScriptKeyValueStore

- (SUScriptKeyValueStore)initWithDomain:(id)a3
{
  SUScriptKeyValueStore *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptKeyValueStore;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
  {
    v4->_domain = (NSString *)objc_msgSend(a3, "copy");
    v4->_keyValueStore = (SSKeyValueStore *)(id)objc_msgSend((id)objc_opt_class(), "_checkOutStoreWithDomain:", a3);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_opt_class(), "_popStoreWithDomain:", self->_domain);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptKeyValueStore;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (void)getValueForKey:(id)a3 usingFunction:(id)a4
{
  SUScriptFunction *v7;
  SSKeyValueStore *keyValueStore;
  NSString *domain;
  _QWORD v10[6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a4);
    -[SUScriptFunction setThisObject:](v7, "setThisObject:", self);
    keyValueStore = self->_keyValueStore;
    domain = self->_domain;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__SUScriptKeyValueStore_getValueForKey_usingFunction___block_invoke;
    v10[3] = &unk_24DE7E140;
    v10[4] = self;
    v10[5] = v7;
    -[SSKeyValueStore getValueForDomain:key:usingBlock:](keyValueStore, "getValueForDomain:key:usingBlock:", domain, a3, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

void __54__SUScriptKeyValueStore_getValueForKey_usingFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    a2 = objc_msgSend(MEMORY[0x24BDFA958], "undefined");
  v4 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a2, 0));
  objc_msgSend(*(id *)(a1 + 40), "setThisObject:", 0);

}

- (void)removeAllValues
{
  -[SSKeyValueStore removeAllValuesForDomain:completionBlock:](self->_keyValueStore, "removeAllValuesForDomain:completionBlock:", self->_domain, 0);
}

- (void)removeValueForKey:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSKeyValueStore setValue:forDomain:key:completionBlock:](self->_keyValueStore, "setValue:forDomain:key:completionBlock:", 0, self->_domain, a3, 0);
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setValueForKey:(id)a3 value:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    -[SSKeyValueStore setValue:forDomain:key:completionBlock:](self->_keyValueStore, "setValue:forDomain:key:completionBlock:", a4, self->_domain, a3, 0);
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (id)valueForKey:(id)a3
{
  NSObject *v5;
  SSKeyValueStore *keyValueStore;
  NSString *domain;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__51;
  v15 = __Block_byref_object_dispose__51;
  v16 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = dispatch_semaphore_create(0);
    keyValueStore = self->_keyValueStore;
    domain = self->_domain;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __37__SUScriptKeyValueStore_valueForKey___block_invoke;
    v10[3] = &unk_24DE7E0F0;
    v10[4] = v5;
    v10[5] = &v11;
    -[SSKeyValueStore getValueForDomain:key:usingBlock:](keyValueStore, "getValueForDomain:key:usingBlock:", domain, a3, v10);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

intptr_t __37__SUScriptKeyValueStore_valueForKey___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    a2 = (void *)objc_msgSend(MEMORY[0x24BDFA958], "undefined");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_className
{
  return CFSTR("iTunesKeyValueStore");
}

+ (id)_checkOutStoreWithDomain:(id)a3
{
  id v4;
  id v5;
  id v6;

  _os_nospin_lock_lock();
  v4 = (id)sAccountStoreCounts;
  if (!sAccountStoreCounts)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD14E0]);
    sAccountStoreCounts = (uint64_t)v4;
  }
  objc_msgSend(v4, "addObject:", a3);
  v5 = (id)sActiveStores;
  if (!sActiveStores)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    sActiveStores = (uint64_t)v5;
  }
  v6 = (id)objc_msgSend(v5, "objectForKey:", a3);
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x24BEB1E78]);
    objc_msgSend((id)sActiveStores, "setObject:forKey:", v6, a3);
  }
  _os_nospin_lock_unlock();
  return v6;
}

+ (void)_popStoreWithDomain:(id)a3
{
  uint64_t v4;

  _os_nospin_lock_lock();
  v4 = objc_msgSend((id)sAccountStoreCounts, "countForObject:", a3);
  objc_msgSend((id)sAccountStoreCounts, "removeObject:", a3);
  if (v4 == 1)
    objc_msgSend((id)sActiveStores, "removeObjectForKey:", a3);
  _os_nospin_lock_unlock();
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_55, 5);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptKeyValueStore;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_55 = (uint64_t)sel_getValueForKey_usingFunction_;
    unk_255187090 = CFSTR("getValue");
    qword_255187098 = (uint64_t)sel_removeAllValues;
    unk_2551870A0 = CFSTR("removeAllValues");
    qword_2551870A8 = (uint64_t)sel_removeValueForKey_;
    unk_2551870B0 = CFSTR("removeValue");
    qword_2551870B8 = (uint64_t)sel_setValueForKey_value_;
    unk_2551870C0 = CFSTR("setValue");
    qword_2551870C8 = (uint64_t)sel_valueForKey_;
    unk_2551870D0 = CFSTR("valueForKey");
  }
}

@end
