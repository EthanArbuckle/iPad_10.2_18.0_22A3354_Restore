@implementation SYDRemotePreferencesSource

+ (id)SYDUbiquitousKeyValueStoreDidChangeExternallyNotification
{
  return CFSTR("SYDUbiquitousKeyValueStoreDidChangeExternallyNotification");
}

- (int64_t)maximumKeyLength
{
  return 128;
}

- (int64_t)maximumKeyCount
{
  return 1024;
}

- (int64_t)maximumDataLengthPerKey
{
  return 0x100000;
}

- (int64_t)maximumTotalDataLength
{
  return 0x100000;
}

- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 shared:(BOOL)a4
{
  return -[SYDRemotePreferencesSource initWithApplicationID:storeID:shared:additionalSource:containerPath:](self, "initWithApplicationID:storeID:shared:additionalSource:containerPath:", a3, 0, a4, 0, 0);
}

- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5
{
  return -[SYDRemotePreferencesSource initWithApplicationID:storeID:shared:additionalSource:containerPath:](self, "initWithApplicationID:storeID:shared:additionalSource:containerPath:", a3, a4, a5, 0, 0);
}

- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5 additionalSource:(BOOL)a6
{
  return -[SYDRemotePreferencesSource initWithApplicationID:storeID:shared:additionalSource:containerPath:](self, "initWithApplicationID:storeID:shared:additionalSource:containerPath:", a3, a4, a5, a6, 0);
}

- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5 additionalSource:(BOOL)a6 containerPath:(__CFString *)a7
{
  return -[SYDRemotePreferencesSource initWithApplicationID:storeID:shared:additionalSource:containerPath:storeType:](self, "initWithApplicationID:storeID:shared:additionalSource:containerPath:storeType:", a3, a4, a5, a6, a7, 0);
}

- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5 additionalSource:(BOOL)a6 containerPath:(__CFString *)a7 storeType:(int64_t)a8
{
  NSObject *v12;
  __CFString *v13;
  SYDClientToDaemonConnection *v14;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  SYDGetConnectionLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v17;
    v20 = 2112;
    v21 = a3;
    v22 = 2112;
    v23 = a4;
    _os_log_debug_impl(&dword_20DA7A000, v12, OS_LOG_TYPE_DEBUG, "Initializing %@ with applicationID=%@ storeID=%@", (uint8_t *)&v18, 0x20u);

  }
  v13 = a4;
  if (v13
    || (+[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:](SYDClientToDaemonConnection, "defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:", a3), (v13 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = -[SYDClientToDaemonConnection initWithStoreIdentifier:type:]([SYDClientToDaemonConnection alloc], "initWithStoreIdentifier:type:", v13, a8);

  }
  else
  {
    if (initWithApplicationID_storeID_shared_additionalSource_containerPath_storeType__onceToken != -1)
      dispatch_once(&initWithApplicationID_storeID_shared_additionalSource_containerPath_storeType__onceToken, &__block_literal_global_0);
    v14 = 0;
  }

  return &v14->super;
}

void __108__SYDRemotePreferencesSource_initWithApplicationID_storeID_shared_additionalSource_containerPath_storeType___block_invoke()
{
  NSObject *v0;

  SYDGetConnectionLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __108__SYDRemotePreferencesSource_initWithApplicationID_storeID_shared_additionalSource_containerPath_storeType___block_invoke_cold_1(v0);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)SYDRemotePreferencesSource;
  -[SYDRemotePreferencesSource dealloc](&v4, sel_dealloc);
}

- (id)objectForKey:(id)a3 error:(id *)a4
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 87, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource objectForKey:error:]", v8);

  return 0;
}

- (void)getValueForKey:(__CFString *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 92, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource getValueForKey:]", v7);

  return 0;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  void *v7;
  objc_class *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 97, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource setObject:forKey:error:]", v9);

  return 0;
}

- (BOOL)removeObjectForKey:(id)a3 error:(id *)a4
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 102, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource removeObjectForKey:error:]", v8);

  return 0;
}

- (void)setValue:(void *)a3 forKey:(__CFString *)a4
{
  objc_class *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 107, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource setValue:forKey:]", v7);

}

- (void)setDefaultsConfiguration:(id)a3
{
  objc_class *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 111, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource setDefaultsConfiguration:]", v6);

}

- (void)scheduleRemoteSynchronization
{
  objc_class *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 115, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource scheduleRemoteSynchronization]", v5);

}

- (void)synchronizationWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 119, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource synchronizationWithCompletionHandler:]", v8);

  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SYDRemotePreferencesSource_synchronizationWithCompletionHandler___block_invoke;
  block[3] = &unk_24C806B48;
  v12 = v5;
  v10 = v5;
  dispatch_async(v9, block);

}

void __67__SYDRemotePreferencesSource_synchronizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BDD0FC8];
  v6[0] = CFSTR("Trying to call a method on an invalid object.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("SyncedDefaults"), 1040, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

}

- (unsigned)synchronize
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 126, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource synchronize]", v6);

  return 0;
}

- (unsigned)synchronizeForced:(unsigned __int8)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 131, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource synchronizeForced:]", v7);

  return 0;
}

- (unsigned)_synchronizeForced:(unsigned __int8)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 136, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource _synchronizeForced:]", v7);

  return 0;
}

- (unsigned)hasExternalChanges
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 141, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource hasExternalChanges]", v6);

  return 0;
}

- (id)copyExternalChangesWithChangeCount:(int64_t *)a3
{
  return 0;
}

- (id)dictionaryRepresentationWithError:(id *)a3
{
  return -[SYDRemotePreferencesSource copyDictionary](self, "copyDictionary", a3);
}

- (__CFDictionary)copyDictionary
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 156, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource copyDictionary]", v6);

  return 0;
}

- (void)registerForSynchronizedDefaults
{
  objc_class *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 161, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource registerForSynchronizedDefaults]", v5);

}

- (void)unregisterForSynchronizedDefaults
{
  objc_class *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 165, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource unregisterForSynchronizedDefaults]", v5);

}

- (void)updateConfiguration
{
  objc_class *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 169, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource updateConfiguration]", v5);

}

- (void)ping
{
  objc_class *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDRemotePreferencesSource.m"), 173, CFSTR("Trying to call %s on invalid class %@"), "-[SYDRemotePreferencesSource ping]", v5);

}

+ (id)SYDRemotePreferencesSourceDidChangeNotification
{
  return CFSTR("SYDRemotePreferencesSourceDidChangeNotification");
}

+ (id)SYDRemotePreferencesSourceConfigurationDidChangeNotification
{
  return CFSTR("SYDRemotePreferencesSourceConfigurationDidChangeNotification");
}

void __108__SYDRemotePreferencesSource_initWithApplicationID_storeID_shared_additionalSource_containerPath_storeType___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20DA7A000, log, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF KVS: Trying to initialize NSUbiquitousKeyValueStore without a store identifier. Please specify a store identifier in your entitlements or initializer.", v1, 2u);
}

@end
