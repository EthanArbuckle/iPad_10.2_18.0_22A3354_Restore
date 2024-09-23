@implementation SBCommunicationPolicyManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken != -1)
    dispatch_once(&sharedInstance___onceToken, &__block_literal_global_101);
  return (id)sharedInstance___instance_2;
}

void __46__SBCommunicationPolicyManager_sharedInstance__block_invoke()
{
  SBCommunicationPolicyManager *v0;
  void *v1;

  v0 = objc_alloc_init(SBCommunicationPolicyManager);
  v1 = (void *)sharedInstance___instance_2;
  sharedInstance___instance_2 = (uint64_t)v0;

}

- (SBCommunicationPolicyManager)init
{
  SBCommunicationPolicyManager *v2;
  DMFCommunicationPolicyMonitor *v3;
  DMFCommunicationPolicyMonitor *communicationPolicyMonitor;
  void *v5;
  uint64_t v6;
  NSDictionary *policiesByBundleIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCommunicationPolicyManager;
  v2 = -[SBCommunicationPolicyManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (DMFCommunicationPolicyMonitor *)objc_alloc_init(MEMORY[0x1E0D1D1E0]);
    communicationPolicyMonitor = v2->_communicationPolicyMonitor;
    v2->_communicationPolicyMonitor = v3;

    -[DMFCommunicationPolicyMonitor policiesByBundleIdentifier](v2->_communicationPolicyMonitor, "policiesByBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    policiesByBundleIdentifier = v2->_policiesByBundleIdentifier;
    v2->_policiesByBundleIdentifier = (NSDictionary *)v6;

    -[DMFCommunicationPolicyMonitor addObserver:forKeyPath:options:context:](v2->_communicationPolicyMonitor, "addObserver:forKeyPath:options:context:", v2, CFSTR("policiesByBundleIdentifier"), 0, &SBCommunicationPolicyManagerKeyValueObserverContext);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBCommunicationPolicyManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("policiesByBundleIdentifier"), &SBCommunicationPolicyManagerKeyValueObserverContext);
  v3.receiver = self;
  v3.super_class = (Class)SBCommunicationPolicyManager;
  -[SBCommunicationPolicyManager dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  _QWORD block[7];

  if (a6 == &SBCommunicationPolicyManagerKeyValueObserverContext)
  {
    block[5] = v6;
    block[6] = v7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__SBCommunicationPolicyManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __79__SBCommunicationPolicyManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v1 + 16), "policiesByBundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copy");
  -[SBCommunicationPolicyManager _setPoliciesByBundleIdentifier:](v1, v2);

}

- (void)_setPoliciesByBundleIdentifier:(uint64_t)a1
{
  id v4;
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    v5 = (id *)(a1 + 8);
    if ((objc_msgSend(*(id *)(a1 + 8), "isEqualToDictionary:", v4) & 1) == 0)
    {
      obj = a2;
      v28 = a1;
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v7 = *v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      v29 = v4;
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v35 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(*v5, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKey:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqual:", v14);

            if ((v15 & 1) == 0)
              objc_msgSend(v6, "addObject:", v12);

            v4 = v29;
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        }
        while (v9);
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v16 = v4;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
            objc_msgSend(v16, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v5, "objectForKey:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v22, "isEqual:", v23);

            if ((v24 & 1) == 0)
              objc_msgSend(v6, "addObject:", v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        }
        while (v18);
      }

      objc_storeStrong(v5, obj);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("SBCommunicationPolicyChangedBundleIdentifiersKey");
      v39 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postNotificationName:object:userInfo:", CFSTR("SBCommunicationPolicyDidChangeNotification"), v28, v26);

      v4 = v29;
    }
  }

}

- (BOOL)shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = -[SBCommunicationPolicyManager _communicationPolicyForBundleIdentifier:]((uint64_t)self, (uint64_t)v4);

  return v5 != 0;
}

- (uint64_t)_communicationPolicyForBundleIdentifier:(uint64_t)result
{
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(*(id *)(result + 8), "objectForKey:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "unsignedIntegerValue");

    return v3;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_policiesByBundleIdentifier, 0);
}

@end
