@implementation REDuetContextStore

- (id)_init
{
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)REDuetContextStore;
  v2 = -[RESingleton _init](&v10, sel__init);
  if (v2)
  {
    if (!CoreDuetContextLibraryCore_frameworkLibrary)
    {
      v15 = xmmword_24CF8C188;
      v16 = 0;
      CoreDuetContextLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (CoreDuetContextLibraryCore_frameworkLibrary)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2050000000;
      v3 = (void *)get_CDClientContextClass_softClass;
      v14 = get_CDClientContextClass_softClass;
      if (!get_CDClientContextClass_softClass)
      {
        *(_QWORD *)&v15 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v15 + 1) = 3221225472;
        v16 = __get_CDClientContextClass_block_invoke;
        v17 = &unk_24CF8AC38;
        v18 = &v11;
        __get_CDClientContextClass_block_invoke((uint64_t)&v15);
        v3 = (void *)v12[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v11, 8);
      objc_msgSend(v4, "userContext");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v2[1];
      v2[1] = v5;

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v2[2];
      v2[2] = v7;

    }
  }
  return v2;
}

- (id)isConnectedToCarQuery
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  REDuetContextQuery *v9;
  id v10;
  id v11;
  REDuetContextQuery *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[2];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!CoreDuetContextLibraryCore_frameworkLibrary)
  {
    v18 = xmmword_24CF8C188;
    v19 = 0;
    CoreDuetContextLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreDuetContextLibraryCore_frameworkLibrary)
    return 0;
  objc_msgSend(get_CDContextQueriesClass(), "keyPathForCarConnectedStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDContextQueriesClass(), "keyPathForCarplayConnectedStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDContextualPredicateClass(), "predicateForChangeAtKeyPath:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDContextualPredicateClass(), "predicateForChangeAtKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v17[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDContextualPredicateClass(), "orPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(get_CDMDCSContextualPredicateClass(), "predicateForIsConnectedToCar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [REDuetContextQuery alloc];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __43__REDuetContextStore_isConnectedToCarQuery__block_invoke;
  v14[3] = &unk_24CF8C098;
  v15 = v2;
  v16 = v3;
  v10 = v3;
  v11 = v2;
  v12 = -[REDuetContextQuery initWithPredicate:remotePredicate:name:evaluationBlock:](v9, "initWithPredicate:remotePredicate:name:evaluationBlock:", v7, v8, CFSTR("connectedToCar"), v14);

  return v12;
}

uint64_t __43__REDuetContextStore_isConnectedToCarQuery__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "BOOLValue") & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v7 = MEMORY[0x24BDBD1C8];
  }
  else
  {
    v7 = MEMORY[0x24BDBD1C0];
  }

  return v7;
}

- (id)isConnectedToAudioBluetoothDeviceQuery
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  REDuetContextQuery *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!CoreDuetContextLibraryCore_frameworkLibrary)
  {
    v17 = xmmword_24CF8C188;
    v18 = 0;
    CoreDuetContextLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreDuetContextLibraryCore_frameworkLibrary)
    return 0;
  objc_msgSend(get_CDContextQueriesClass(), "keyPathForBluetoothDataDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDContextQueriesClass(), "bluetoothDeviceTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self.%@.value.%@ in %@"), v2, v3, &unk_24CFC1CA0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDContextualPredicateClass(), "predicateForKeyPath:withPredicate:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDContextQueriesClass(), "predicateForBluetoothConnectionStatus:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDContextQueriesClass(), "predicateForBluetoothConnectionStatus:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDContextualPredicateClass(), "orPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v5;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDContextualPredicateClass(), "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(get_CDMDCSContextualPredicateClass(), "predicateForIsConnectedToAudioBluetoothDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[REDuetContextQuery initWithPredicate:remotePredicate:name:evaluationBlock:]([REDuetContextQuery alloc], "initWithPredicate:remotePredicate:name:evaluationBlock:", v11, v12, CFSTR("connectedToAudioBluetooth"), &__block_literal_global_16);

  return v13;
}

uint64_t __60__REDuetContextStore_isConnectedToAudioBluetoothDeviceQuery__block_invoke()
{
  return MEMORY[0x24BDBD1C8];
}

- (void)registerForQuery:(id)a3 updateBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _REContextRegistration *v9;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      os_unfair_lock_lock((os_unfair_lock_t)&REContextRegistrationLock);
      v9 = -[_REContextRegistration initWithQuery:]([_REContextRegistration alloc], "initWithQuery:", v7);

      -[_REContextRegistration setCallback:](v9, "setCallback:", v6);
      -[_REContextRegistration setContext:](v9, "setContext:", self->_context);
      -[_REContextRegistration uuid](v9, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registrations, "setObject:forKeyedSubscript:", v9, v8);
      os_unfair_lock_unlock((os_unfair_lock_t)&REContextRegistrationLock);
      -[_REContextRegistration registerWithContext](v9, "registerWithContext");
      -[_REContextRegistration evaluateQuery](v9, "evaluateQuery");

    }
  }
}

- (void)unregisterForQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)&REContextRegistrationLock);
    objc_msgSend(v4, "uuid");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_registrations, "objectForKeyedSubscript:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[NSMutableDictionary removeObjectForKey:](self->_registrations, "removeObjectForKey:", v6);
    os_unfair_lock_unlock((os_unfair_lock_t)&REContextRegistrationLock);
    objc_msgSend(v5, "deregisterWithContext");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
