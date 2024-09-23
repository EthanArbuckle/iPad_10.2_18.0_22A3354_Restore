@implementation PFPosterExtensionInstanceProvider

- (PFPosterExtensionInstanceProvider)init
{
  return -[PFPosterExtensionInstanceProvider initWithDefaultInstanceIdentifier:](self, "initWithDefaultInstanceIdentifier:", 0);
}

- (PFPosterExtensionInstanceProvider)initWithDefaultInstanceIdentifier:(id)a3
{
  id v4;
  PFPosterExtensionInstanceProvider *v5;
  uint64_t v6;
  NSUUID *defaultInstanceIdentifier;
  uint64_t v8;
  NSMapTable *extensionBundleIdentifierToReasonMap;
  uint64_t v10;
  NSMapTable *extensionBundleIdentifierWithReasonToInstanceMap;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFPosterExtensionInstanceProvider;
  v5 = -[PFPosterExtensionInstanceProvider init](&v13, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "pf_defaultInstanceIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    defaultInstanceIdentifier = v5->_defaultInstanceIdentifier;
    v5->_defaultInstanceIdentifier = (NSUUID *)v6;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    extensionBundleIdentifierToReasonMap = v5->_extensionBundleIdentifierToReasonMap;
    v5->_extensionBundleIdentifierToReasonMap = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    extensionBundleIdentifierWithReasonToInstanceMap = v5->_extensionBundleIdentifierWithReasonToInstanceMap;
    v5->_extensionBundleIdentifierWithReasonToInstanceMap = (NSMapTable *)v10;

  }
  return v5;
}

- (id)acquireInstanceForExtension:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  PFPosterExtensionInstanceProvider *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSUUID *v18;
  PFPosterExtensionInstance *v19;
  void *v20;
  void *v21;
  NSUUID *v22;
  NSUUID *v23;
  PFPosterExtensionInstance *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint8_t buf[4];
  PFPosterExtensionInstanceProvider *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  NSUUID *v34;
  __int16 v35;
  __CFString *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (__CFString *)a4;
  if (v9)
    v10 = v9;
  else
    v10 = &stru_2515444D8;
  if (v8)
  {
    objc_msgSend(v8, "posterExtensionBundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("-['%@']"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self;
    objc_sync_enter(v13);
    -[NSMapTable objectForKey:](v13->_extensionBundleIdentifierWithReasonToInstanceMap, "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[NSMapTable objectForKey:](v13->_extensionBundleIdentifierToReasonMap, "objectForKey:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v10);

      PFLogExtensionInstance();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "posterExtensionBundleIdentifier");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "instanceIdentifier");
        v18 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v30 = v13;
        v31 = 2112;
        v32 = v17;
        v33 = 2114;
        v34 = v18;
        v35 = 2114;
        v36 = v10;
        _os_log_impl(&dword_24462A000, v16, OS_LOG_TYPE_DEFAULT, "(%p) extension '%@' has instance %{public}@; will use for reason '%{public}@'",
          buf,
          0x2Au);

      }
      v19 = v14;
    }
    else
    {
      if (-[__CFString length](v10, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD1880], "pf_UUIDFromArbitraryString:", v10);
        v22 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = v13->_defaultInstanceIdentifier;
      }
      v23 = v22;
      v24 = -[PFPosterExtensionInstance initWithExtension:instanceIdentifier:]([PFPosterExtensionInstance alloc], "initWithExtension:instanceIdentifier:", v8, v22);
      -[PFPosterExtensionInstance addInstanceObserver:](v24, "addInstanceObserver:", v13);
      -[NSMapTable objectForKey:](v13->_extensionBundleIdentifierToReasonMap, "objectForKey:", v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        v25 = (void *)objc_opt_new();
        -[NSMapTable setObject:forKey:](v13->_extensionBundleIdentifierToReasonMap, "setObject:forKey:", v25, v11);
      }
      objc_msgSend(v25, "addObject:", v10);
      PFLogExtensionInstance();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "posterExtensionBundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v30 = v13;
        v31 = 2112;
        v32 = v27;
        v33 = 2114;
        v34 = v23;
        v35 = 2114;
        v36 = v10;
        _os_log_impl(&dword_24462A000, v26, OS_LOG_TYPE_DEFAULT, "(%p) extension '%@' booted new instance %{public}@ for reason '%{public}@'", buf, 0x2Au);

      }
      -[NSMapTable setObject:forKey:](v13->_extensionBundleIdentifierWithReasonToInstanceMap, "setObject:forKey:", v24, v12);
      v19 = v24;

    }
    objc_sync_exit(v13);

  }
  else
  {
    if (a5)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v37[0] = *MEMORY[0x24BDD0FD8];
      v37[1] = CFSTR("reason");
      v38[0] = CFSTR("cannot acquire instance for nil extension");
      v38[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pf_errorWithCode:userInfo:", 3, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    PFLogExtensionInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PFPosterExtensionInstanceProvider acquireInstanceForExtension:reason:error:].cold.1((uint64_t)self, (uint64_t)v10, v11);
    v19 = 0;
  }

  return v19;
}

- (void)relinquishExtensionInstance:(id)a3 reason:(id)a4
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  PFPosterExtensionInstanceProvider *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  PFPosterExtensionInstanceProvider *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (__CFString *)a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extensionInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterExtensionInstanceProvider relinquishExtensionInstance:reason:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463023CLL);
  }
  if (v8)
    v9 = v8;
  else
    v9 = &stru_2515444D8;
  objc_msgSend(v7, "extension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterExtensionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("-['%@']"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self;
  objc_sync_enter(v13);
  PFLogExtensionInstance();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "instanceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v19 = v13;
    v20 = 2112;
    v21 = v11;
    v22 = 2114;
    v23 = v15;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_24462A000, v14, OS_LOG_TYPE_DEFAULT, "(%p) extension '%@'/%{public}@ for reason '%{public}@'", buf, 0x2Au);

  }
  -[NSMapTable objectForKey:](v13->_extensionBundleIdentifierToReasonMap, "objectForKey:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObject:", v9);
  if (!objc_msgSend(v16, "count"))
  {
    -[NSMapTable removeObjectForKey:](v13->_extensionBundleIdentifierWithReasonToInstanceMap, "removeObjectForKey:", v12);
    -[NSMapTable removeObjectForKey:](v13->_extensionBundleIdentifierToReasonMap, "removeObjectForKey:", v11);
    objc_msgSend(v7, "invalidate");
  }

  objc_sync_exit(v13);
}

- (void)noteExtensionsWereUpdated:(id)a3
{
  PFPosterExtensionInstanceProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  PFPosterExtensionInstanceProvider *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  objc_msgSend(v24, "valueForKey:", CFSTR("posterExtensionBundleIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x24BDBCF20];
  -[NSMapTable keyEnumerator](v4->_extensionBundleIdentifierToReasonMap, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v8;
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "minusSet:", v25);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
  if (v10)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      v28 = v10;
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v4->_extensionBundleIdentifierToReasonMap, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[NSMapTable removeObjectForKey:](v4->_extensionBundleIdentifierToReasonMap, "removeObjectForKey:", v11);
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          -[NSMapTable keyEnumerator](v4->_extensionBundleIdentifierWithReasonToInstanceMap, "keyEnumerator");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "allObjects");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v14, "copy");

          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v31 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                if (objc_msgSend(v19, "hasPrefix:", v11))
                {
                  -[NSMapTable objectForKey:](v4->_extensionBundleIdentifierWithReasonToInstanceMap, "objectForKey:", v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "invalidate");
                  -[NSMapTable removeObjectForKey:](v4->_extensionBundleIdentifierWithReasonToInstanceMap, "removeObjectForKey:", v19);
                  PFLogExtensionInstance();
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v20, "instanceIdentifier");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 134218498;
                    v39 = v4;
                    v40 = 2112;
                    v41 = v11;
                    v42 = 2114;
                    v43 = v22;
                    _os_log_impl(&dword_24462A000, v21, OS_LOG_TYPE_DEFAULT, "(%p) cleaning up after now invalid extension '%@'/%{public}@", buf, 0x20u);

                  }
                }
              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
            }
            while (v16);
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    }
    while (v10);
  }

  objc_sync_exit(v4);
}

- (id)instanceForExtension:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PFPosterExtensionInstanceProvider *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "posterExtensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("-['%@']"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self;
  objc_sync_enter(v10);
  -[NSMapTable objectForKey:](v10->_extensionBundleIdentifierWithReasonToInstanceMap, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v10);

  return v11;
}

- (void)extensionInstanceDidInvalidate:(id)a3
{
  id v4;
  PFPosterExtensionInstanceProvider *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  PFPosterExtensionInstanceProvider *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    PFLogExtensionInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "extension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "posterExtensionBundleIdentifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "instanceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v26 = v5;
      v27 = 2112;
      v28 = v8;
      v29 = 2114;
      v30 = v9;
      _os_log_impl(&dword_24462A000, v6, OS_LOG_TYPE_DEFAULT, "(%p) invalidated instance %@/%{public}@", buf, 0x20u);

    }
    v10 = (void *)objc_opt_new();
    -[NSMapTable dictionaryRepresentation](v5->_extensionBundleIdentifierWithReasonToInstanceMap, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __68__PFPosterExtensionInstanceProvider_extensionInstanceDidInvalidate___block_invoke;
    v21[3] = &unk_251543AE0;
    v22 = v4;
    v12 = v10;
    v23 = v12;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v21);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v13);
          -[NSMapTable removeObjectForKey:](v5->_extensionBundleIdentifierWithReasonToInstanceMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
      }
      while (v14);
    }

    objc_sync_exit(v5);
  }

}

uint64_t __68__PFPosterExtensionInstanceProvider_extensionInstanceDidInvalidate___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(result + 32) == a3)
    return objc_msgSend(*(id *)(result + 40), "addObject:", a2);
  return result;
}

- (void)cancel
{
  PFPosterExtensionInstanceProvider *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  PFPosterExtensionInstanceProvider *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  PFLogExtensionInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v2;
    _os_log_impl(&dword_24462A000, v3, OS_LOG_TYPE_DEFAULT, "(%p) cancel", (uint8_t *)&v6, 0xCu);
  }

  -[NSMapTable removeAllObjects](v2->_extensionBundleIdentifierWithReasonToInstanceMap, "removeAllObjects");
  -[NSMapTable objectEnumerator](v2->_extensionBundleIdentifierWithReasonToInstanceMap, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_181);

  -[NSMapTable removeAllObjects](v2->_extensionBundleIdentifierWithReasonToInstanceMap, "removeAllObjects");
  objc_sync_exit(v2);

}

uint64_t __43__PFPosterExtensionInstanceProvider_cancel__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (NSUUID)defaultInstanceIdentifier
{
  return self->_defaultInstanceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifierWithReasonToInstanceMap, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifierToReasonMap, 0);
}

- (void)acquireInstanceForExtension:(uint64_t)a1 reason:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_24462A000, log, OS_LOG_TYPE_ERROR, "(%p) no extension specified; will not acquire instance for reason '%{public}@'",
    (uint8_t *)&v3,
    0x16u);
}

- (void)relinquishExtensionInstance:(const char *)a1 reason:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
