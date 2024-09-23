@implementation PDCApplicationEventListener

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_3);
  return (id)sharedInstance_result;
}

void __45__PDCApplicationEventListener_sharedInstance__block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  PDCApplicationEventListener *v3;
  void *v4;
  id v5;

  PDCGlobalConsentStoreInstance();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  PDCGlobalApplicationEnvironment();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.PrivacyDisclosure.PDCApplicationEventListener", v1);

  v3 = -[PDCApplicationEventListener initWithConsentStore:applicationEnvironment:targetQueue:]([PDCApplicationEventListener alloc], "initWithConsentStore:applicationEnvironment:targetQueue:", v5, v0, v2);
  v4 = (void *)sharedInstance_result;
  sharedInstance_result = (uint64_t)v3;

}

- (PDCApplicationEventListener)initWithConsentStore:(id)a3 applicationEnvironment:(id)a4 targetQueue:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  PDCApplicationEventListener *v12;
  PDCApplicationEventListener *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  PDCApplicationEventListener *v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PDCApplicationEventListener;
  v12 = -[PDCApplicationEventListener init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_consentStore, a3);
    objc_storeStrong((id *)&v13->_applicationEnvironment, a4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PDCApplicationEventListener.0x%p"), v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create_with_target_V2(v15, v16, v11);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v17;

    v13->_activated._Value = 0;
    v19 = v13;

  }
  return v13;
}

- (void)activate
{
  atomic_flag *p_activated;
  unsigned __int8 v4;
  NSObject *queue;
  _QWORD block[5];

  if (+[PDCPreflightManager isPreflightFeatureEnabled](PDCPreflightManager, "isPreflightFeatureEnabled"))
  {
    p_activated = &self->_activated;
    do
      v4 = __ldaxr((unsigned __int8 *)p_activated);
    while (__stlxr(1u, (unsigned __int8 *)p_activated));
    if ((v4 & 1) == 0)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __39__PDCApplicationEventListener_activate__block_invoke;
      block[3] = &unk_2515A2D00;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
  else
  {
    -[PDCApplicationEventListener invalidate](self, "invalidate");
  }
}

uint64_t __39__PDCApplicationEventListener_activate__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(result + 24))
  {
    result = objc_msgSend((id)result, "cancelled");
    if ((result & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "monitorAppEventsWithDelegate:onQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 24);
      *(_QWORD *)(v4 + 24) = v3;

      return objc_msgSend(*(id *)(a1 + 32), "checkForStaleConsentRecords");
    }
  }
  return result;
}

- (void)invalidate
{
  -[PDCApplicationEventListener setCancelled:](self, "setCancelled:", 1);
  -[PDCApplicationEnvironmentMonitoringHandle invalidate](self->_environmentMonitoringHandle, "invalidate");
}

- (void)checkForStaleConsentRecords
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PDCConsentStore consentedBundleIdentifiers](self->_consentStore, "consentedBundleIdentifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[PDCApplicationEnvironment applicationRecordForBundleIdentifier:](self->_applicationEnvironment, "applicationRecordForBundleIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          v10 = (id)-[PDCConsentStore writeUserConsentedRegulatoryDisclosureVersion:forBundleIdentifier:](self->_consentStore, "writeUserConsentedRegulatoryDisclosureVersion:forBundleIdentifier:", 0, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)applicationDidUninstall:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if (!-[PDCApplicationEventListener cancelled](self, "cancelled"))
  {
    -[PDCConsentStore writeUserConsentedRegulatoryDisclosureVersion:forBundleIdentifier:](self->_consentStore, "writeUserConsentedRegulatoryDisclosureVersion:forBundleIdentifier:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[PDCApplicationEventListener applicationDidUninstall:].cold.1((uint64_t)v4, (uint64_t)v5, v6);
    }

  }
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_environmentMonitoringHandle, 0);
  objc_storeStrong((id *)&self->_applicationEnvironment, 0);
  objc_storeStrong((id *)&self->_consentStore, 0);
}

- (void)applicationDidUninstall:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2449FF000, log, OS_LOG_TYPE_ERROR, "Error while deleting consent record for removed app %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
