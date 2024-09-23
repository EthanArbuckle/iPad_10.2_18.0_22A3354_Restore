@implementation REPipedLocationDonor

- (id)_init
{
  _QWORD *v2;
  id v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;
  void *v7;
  REObserverStore *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)REPipedLocationDonor;
  v2 = -[RESingleton _init](&v13, sel__init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.relevanced.pipedlocationdonor.%p"), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    v5 = (void *)v2[3];
    v2[3] = v4;

    v6 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v7 = (void *)v2[5];
    v2[5] = v6;

    v8 = objc_alloc_init(REObserverStore);
    v9 = (void *)v2[1];
    v2[1] = v8;

    objc_msgSend((id)objc_opt_class(), "_locationFromDefaults");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v2[4];
    v2[4] = v10;

  }
  return v2;
}

- (void)setConnection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__REPipedLocationDonor_setConnection___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __38__REPipedLocationDonor_setConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  if (v3)
  {
    *(_QWORD *)(v2 + 16) = 0;
    v4 = v3;

    objc_msgSend(v4, "setInvalidationHandler:", 0);
    objc_msgSend(v4, "setExportedObject:", 0);
    objc_msgSend(v4, "invalidate");

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 16), *(id *)(a1 + 40));
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  REPipedLocationDonorInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  REPipedLocationReceiverInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:");
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __38__REPipedLocationDonor_setConnection___block_invoke_2;
  v13 = &unk_24CF8AAC8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "setInvalidationHandler:", &v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume", v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __38__REPipedLocationDonor_setConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInvalidation");

}

- (void)addObserver:(id)a3
{
  -[REObserverStore addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[REObserverStore removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)updateLocation:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  REObserverStore *observers;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  RELogForDomain(5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v13 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_INFO, "REPipedLocationDonor updated location to %s", buf, 0xCu);

  }
  -[NSLock lock](self->_locationAccessLock, "lock");
  objc_storeStrong((id *)&self->_location, a3);
  -[NSLock unlock](self->_locationAccessLock, "unlock");
  objc_msgSend((id)objc_opt_class(), "_saveLocationIntoDefaultsWithLocation:", v5);
  observers = self->_observers;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__REPipedLocationDonor_updateLocation___block_invoke;
  v10[3] = &unk_24CF90708;
  v11 = v5;
  v9 = v5;
  -[REObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v10);

}

uint64_t __39__REPipedLocationDonor_updateLocation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationDidUpdate:", *(_QWORD *)(a1 + 32));
}

- (CLLocation)location
{
  CLLocation *v3;

  -[NSLock lock](self->_locationAccessLock, "lock");
  v3 = self->_location;
  -[NSLock unlock](self->_locationAccessLock, "unlock");
  return v3;
}

- (void)_handleInvalidation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__REPipedLocationDonor__handleInvalidation__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __43__REPipedLocationDonor__handleInvalidation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

+ (id)_locationFromDefaults
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("LastPipedLocation"), CFSTR("com.apple.RelevanceEngine"));
  if (v2)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v13;
    if (!v3)
    {
      RELogForDomain(5);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[REPipedLocationDonor _locationFromDefaults].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (void)_saveLocationIntoDefaultsWithLocation:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_6:
    CFPreferencesSetAppValue(CFSTR("LastPipedLocation"), v4, CFSTR("com.apple.RelevanceEngine"));
    goto LABEL_7;
  }
  RELogForDomain(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[REPipedLocationDonor _saveLocationIntoDefaultsWithLocation:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAccessLock, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)_locationFromDefaults
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "REPipedLocationDonor: Failed to decode last location with error: %@", a5, a6, a7, a8, 2u);
}

+ (void)_saveLocationIntoDefaultsWithLocation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "REPipedLocationDonor: Failed to serialize location: %@", a5, a6, a7, a8, 2u);
}

@end
