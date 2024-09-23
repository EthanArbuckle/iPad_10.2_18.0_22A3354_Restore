@implementation PKApplicationRegistry

- (PKApplicationRegistry)initWithArchiveFileURL:(id)a3
{
  id v4;
  PKApplicationRegistry *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *applicationRegistryQueue;
  NSObject *v8;
  _QWORD v10[4];
  PKApplicationRegistry *v11;
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKApplicationRegistry;
  v5 = -[PKApplicationRegistry init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.passkit.applicationregistry", 0);
    applicationRegistryQueue = v5->_applicationRegistryQueue;
    v5->_applicationRegistryQueue = (OS_dispatch_queue *)v6;

    v8 = v5->_applicationRegistryQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__PKApplicationRegistry_initWithArchiveFileURL___block_invoke;
    v10[3] = &unk_1E2ABE0D0;
    v11 = v5;
    v12 = v4;
    dispatch_sync(v8, v10);

  }
  return v5;
}

void __48__PKApplicationRegistry_initWithArchiveFileURL___block_invoke(uint64_t a1)
{
  id v2;
  dispatch_semaphore_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v3 = dispatch_semaphore_create(1);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = v6;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v2, "fileExistsAtPath:", v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", *(_QWORD *)(a1 + 40), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_11:

      goto LABEL_12;
    }
    v26 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v12, &v26);
    v14 = v26;
    v15 = v14;
    if (v13)
    {
      if (v14)
      {
        objc_msgSend(v13, "finishDecoding");
      }
      else
      {
        v16 = (void *)MEMORY[0x1E0C99E60];
        v17 = objc_opt_class();
        objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        objc_msgSend(v13, "decodeTopLevelObjectOfClasses:forKey:error:", v18, CFSTR("registeredBundleIdentifiers"), &v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v25;

        v20 = objc_msgSend(v19, "mutableCopy");
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(void **)(v21 + 8);
        *(_QWORD *)(v21 + 8) = v20;

        objc_msgSend(*(id *)(a1 + 32), "_validateRegisteredApplications");
        objc_msgSend(v13, "finishDecoding");
        if (!v15)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
    }
    PKLogFacilityTypeGetObject(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v28 = v24;
      v29 = 2114;
      v30 = v15;
      _os_log_error_impl(&dword_18FC92000, v23, OS_LOG_TYPE_ERROR, "PKApplicationRegistry: error trying to read %{public}@. The data will be discarded. %{public}@.", buf, 0x16u);
    }

    goto LABEL_10;
  }
LABEL_12:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKApplicationRegistry;
  -[PKApplicationRegistry dealloc](&v4, sel_dealloc);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *applicationRegistryQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PKApplicationRegistry *v9;

  v4 = a3;
  applicationRegistryQueue = self->_applicationRegistryQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PKApplicationRegistry_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(applicationRegistryQueue, v7);

}

uint64_t __50__PKApplicationRegistry_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PKApplicationRegistry_applicationsDidUninstall___block_invoke_2;
  v4[3] = &unk_1E2ADA0F8;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
  return objc_msgSend(*(id *)(a1 + 40), "_requestArchiveToDisk");
}

void __50__PKApplicationRegistry_applicationsDidUninstall___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", v3);

}

- (BOOL)registerApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *applicationRegistryQueue;
  id v6;
  _QWORD block[4];
  id v9;
  PKApplicationRegistry *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  applicationRegistryQueue = self->_applicationRegistryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKApplicationRegistry_registerApplicationWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E2ACB410;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(applicationRegistryQueue, block);
  LOBYTE(applicationRegistryQueue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)applicationRegistryQueue;
}

void __65__PKApplicationRegistry_registerApplicationWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  v3 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v10);
  v5 = v10;
  if (v5)
  {
    PKLogFacilityTypeGetObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKApplicationRegistry failed to obtain application record for %@ with error %@", buf, 0x16u);
    }

  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || (objc_msgSend(v4, "applicationState"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isInstalled"),
        v8,
        v9))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_requestArchiveToDisk");
  }

}

- (BOOL)applicationIsRegisteredWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *applicationRegistryQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  applicationRegistryQueue = self->_applicationRegistryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKApplicationRegistry_applicationIsRegisteredWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E2AD9EE0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(applicationRegistryQueue, block);
  LOBYTE(applicationRegistryQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)applicationRegistryQueue;
}

uint64_t __69__PKApplicationRegistry_applicationIsRegisteredWithBundleIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)_validateRegisteredApplications
{
  void *v3;
  NSMutableSet *registeredBundleIdentifiers;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  registeredBundleIdentifiers = self->_registeredBundleIdentifiers;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PKApplicationRegistry__validateRegisteredApplications__block_invoke;
  v6[3] = &unk_1E2AC2E40;
  v7 = v3;
  v5 = v3;
  -[NSMutableSet enumerateObjectsUsingBlock:](registeredBundleIdentifiers, "enumerateObjectsUsingBlock:", v6);
  -[NSMutableSet minusSet:](self->_registeredBundleIdentifiers, "minusSet:", v5);
  -[PKApplicationRegistry _requestArchiveToDisk](self, "_requestArchiveToDisk");

}

void __56__PKApplicationRegistry__validateRegisteredApplications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);
  objc_msgSend(v3, "applicationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInstalled");

  if ((v5 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (void)_requestArchiveToDisk
{
  dispatch_time_t v3;
  NSObject *applicationRegistryQueue;
  _QWORD block[5];

  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_archiveSemaphore, 0))
  {
    v3 = dispatch_time(0, 2000000000);
    applicationRegistryQueue = self->_applicationRegistryQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PKApplicationRegistry__requestArchiveToDisk__block_invoke;
    block[3] = &unk_1E2ABE120;
    block[4] = self;
    dispatch_after(v3, applicationRegistryQueue, block);
  }
}

intptr_t __46__PKApplicationRegistry__requestArchiveToDisk__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 16))
  {
    if (!objc_msgSend(*(id *)(v1 + 8), "count"))
      goto LABEL_7;
    PKLogFacilityTypeGetObject(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Archiving Application Registry", v7, 2u);
    }

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v4, "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("registeredBundleIdentifiers"));
    objc_msgSend(v4, "finishEncoding");
    objc_msgSend(v4, "encodedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "writeToURL:atomically:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 1);
      PKExcludeFileURLFromBackup(*(void **)(*(_QWORD *)(a1 + 32) + 16));
    }
    else
    {
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeItemAtURL:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
    }

    v1 = *(_QWORD *)(a1 + 32);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 24));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRegistryQueue, 0);
  objc_storeStrong((id *)&self->_archiveSemaphore, 0);
  objc_storeStrong((id *)&self->_archiveFileURL, 0);
  objc_storeStrong((id *)&self->_registeredBundleIdentifiers, 0);
}

@end
