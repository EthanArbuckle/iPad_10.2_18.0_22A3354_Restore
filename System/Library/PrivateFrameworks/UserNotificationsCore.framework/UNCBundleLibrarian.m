@implementation UNCBundleLibrarian

void __58__UNCBundleLibrarian_uniqueIdentifierForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_bundleIdentifierForUniqueIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "Unique identifier provided when requesting unique identifer for bundle identifier (%{public}@)", (uint8_t *)&v11, 0xCu);
    }
    v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_uniqueIdentifierForBundleIdentifier:", *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)_queue_bundleIdentifierForUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UNCBundleLibrarian _queue_loadBundleLibraryIfNeeded](self, "_queue_loadBundleLibraryIfNeeded");
  -[NSMutableDictionary objectForKey:](self->_uuidToBundleMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_queue_uniqueIdentifierForBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UNCBundleLibrarian _queue_loadBundleLibraryIfNeeded](self, "_queue_loadBundleLibraryIfNeeded");
  -[NSMutableDictionary objectForKey:](self->_bundleToUUIDMap, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v4;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "No unique identifier for bundleID %{public}@ found; adding a mapping to %{public}@",
        (uint8_t *)&v10,
        0x16u);
    }
    -[UNCBundleLibrarian _queue_addEntryForBundleIdentifier:uniqueIdentifier:](self, "_queue_addEntryForBundleIdentifier:uniqueIdentifier:", v4, v6);
  }

  return v6;
}

- (void)_queue_loadBundleLibraryIfNeeded
{
  void *v3;

  if (!self->_bundleToUUIDMap)
  {
    v3 = (void *)MEMORY[0x24BCFE9BC]();
    -[UNCBundleLibrarian _queue_loadBundleLibrary](self, "_queue_loadBundleLibrary");
    objc_autoreleasePoolPop(v3);
  }
}

- (id)uniqueIdentifierForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__UNCBundleLibrarian_uniqueIdentifierForBundleIdentifier___block_invoke;
  block[3] = &unk_251AE05B8;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  dispatch_sync(queue, block);
  v7 = (void *)v15[5];
  if (!v7)
  {
    v8 = *MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "No unique identifier for bundleID %{public}@", buf, 0xCu);
    }
    v7 = (void *)v15[5];
  }
  v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (UNCBundleLibrarian)initWithDirectory:(id)a3
{
  id v4;
  UNCBundleLibrarian *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleLibraryPath;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNCBundleLibrarian;
  v5 = -[UNCBundleLibrarian init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Library"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("plist"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleLibraryPath = v5->_bundleLibraryPath;
    v5->_bundleLibraryPath = (NSString *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.UserNotificationServer.librarian", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

  }
  return v5;
}

- (void)bootstrapLibraryForBundleIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__UNCBundleLibrarian_bootstrapLibraryForBundleIdentifiers___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __59__UNCBundleLibrarian_bootstrapLibraryForBundleIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadBundleLibraryIfNeeded");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    v8 = (os_log_t *)MEMORY[0x24BDF89B8];
    *(_QWORD *)&v4 = 138543618;
    v14 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v2);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v10, v14, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUIDString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v11, v10);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v10, v11);
          v13 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v10;
            v21 = 2114;
            v22 = v11;
            _os_log_impl(&dword_2499A5000, v13, OS_LOG_TYPE_DEFAULT, "Creating library mapping from %{public}@ to %{public}@", buf, 0x16u);
          }
          v6 = 1;
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v5);

    if ((v6 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_queue_saveDictionary:atPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {

  }
}

- (id)bundleIdentifierForUniqueIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__UNCBundleLibrarian_bundleIdentifierForUniqueIdentifier___block_invoke;
  block[3] = &unk_251AE0278;
  v13 = &v14;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  dispatch_sync(queue, block);
  v7 = (void *)v15[5];
  if (!v7)
  {
    v8 = *MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "No bundleID for unique identifier %{public}@", buf, 0xCu);
    }
    v7 = (void *)v15[5];
  }
  v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __58__UNCBundleLibrarian_bundleIdentifierForUniqueIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_bundleIdentifierForUniqueIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeMappingForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  UNCBundleLibrarian *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__UNCBundleLibrarian_removeMappingForBundleIdentifier___block_invoke;
  block[3] = &unk_251AE01A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __55__UNCBundleLibrarian_removeMappingForBundleIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_2499A5000, v2, OS_LOG_TYPE_DEFAULT, "Removing library mapping for %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_queue_removeEntryForBundleIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)migrateLibraryFromDirectory:(id)a3 toDirectory:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__UNCBundleLibrarian_migrateLibraryFromDirectory_toDirectory___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __62__UNCBundleLibrarian_migrateLibraryFromDirectory_toDirectory___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  char v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)))
  {
    v3 = *MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138543362;
      v24 = v4;
      _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "Library exists at %{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", CFSTR("Library"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

    if (v8)
    {
      v9 = (os_log_t *)MEMORY[0x24BDF89B8];
      v10 = *MEMORY[0x24BDF89B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v6;
        _os_log_impl(&dword_2499A5000, v10, OS_LOG_TYPE_DEFAULT, "Migrate library from %{public}@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v22 = 0;
      v13 = objc_msgSend(v11, "moveItemAtPath:toPath:error:", v6, v12, &v22);
      v14 = v22;

      if ((v13 & 1) == 0)
      {
        v15 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          *(_DWORD *)buf = 138543874;
          v24 = v6;
          v25 = 2114;
          v26 = v20;
          v27 = 2114;
          v28 = v14;
          _os_log_error_impl(&dword_2499A5000, v15, OS_LOG_TYPE_ERROR, "Could not move %{public}@ to %{public}@ as a part of library migration error: %{public}@", buf, 0x20u);
        }
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 40);
      v21 = 0;
      v18 = objc_msgSend(v16, "removeItemAtPath:error:", v17, &v21);
      v19 = v21;

      if ((v18 & 1) == 0 && os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        __62__UNCBundleLibrarian_migrateLibraryFromDirectory_toDirectory___block_invoke_cold_1();
      objc_msgSend(*(id *)(a1 + 32), "_queue_removeUnknownDirectoriesFromLibrary");
      objc_msgSend(*(id *)(a1 + 32), "_queue_removeUnknownDirectoriesInDirectory:", *(_QWORD *)(a1 + 48));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_queue_migrateBundleDirectoriesInDirectory:", *(_QWORD *)(a1 + 48));
    }

  }
}

- (void)_queue_removeUnknownDirectoriesFromLibrary
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[UNCBundleLibrarian _queue_loadBundleLibraryIfNeeded](self, "_queue_loadBundleLibraryIfNeeded");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_bundleToUUIDMap, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    v9 = (os_log_t *)MEMORY[0x24BDF89B8];
    *(_QWORD *)&v6 = 138543362;
    v13 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[UNCBundleLibrarian _isUUIDString:](self, "_isUUIDString:", v11, v13))
        {
          v12 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            v19 = v11;
            _os_log_error_impl(&dword_2499A5000, v12, OS_LOG_TYPE_ERROR, "Removing invalid library mapping for %{public}@", buf, 0xCu);
          }
          -[UNCBundleLibrarian _queue_removeEntryForBundleIdentifier:](self, "_queue_removeEntryForBundleIdentifier:", v11);
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

}

- (void)_queue_removeUnknownDirectoriesInDirectory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  unsigned __int8 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UNCBundleLibrarian _queue_loadBundleLibraryIfNeeded](self, "_queue_loadBundleLibraryIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  objc_msgSend(v23, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v9);
        -[NSMutableDictionary objectForKey:](self->_uuidToBundleMap, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          goto LABEL_7;
        if (-[UNCBundleLibrarian _isUUIDString:](self, "_isUUIDString:", v10))
        {
          objc_msgSend(v24, "stringByAppendingPathComponent:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v11, &v26);
          v14 = v26;

          if (v13)
            v15 = v14 == 0;
          else
            v15 = 1;
          if (!v15)
          {
            v16 = *MEMORY[0x24BDF89B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v32 = v11;
              _os_log_error_impl(&dword_2499A5000, v16, OS_LOG_TYPE_ERROR, "Removing %{public}@ as it is a stale notification source", buf, 0xCu);
            }
            objc_msgSend(v24, "stringByAppendingPathComponent:", v10);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 0;
            v19 = objc_msgSend(v18, "removeItemAtPath:error:", v17, &v25);
            v20 = v25;

            if ((v19 & 1) == 0)
            {
              v21 = *MEMORY[0x24BDF89B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v32 = v11;
                v33 = 2114;
                v34 = v20;
                _os_log_error_impl(&dword_2499A5000, v21, OS_LOG_TYPE_ERROR, "Could not remove %{public}@ in cleanup after library migration error: %{public}@", buf, 0x16u);
              }
            }

          }
LABEL_7:

        }
        ++v9;
      }
      while (v7 != v9);
      v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      v7 = v22;
    }
    while (v22);
  }

}

- (void)_queue_migrateBundleDirectoriesInDirectory:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id obj;
  id v37;
  id v38;
  unsigned __int8 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDF89B8];
  v6 = *MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v45 = v4;
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "Migrate library from bundle directory struction %{public}@", buf, 0xCu);
  }
  -[UNCBundleLibrarian _queue_loadBundleLibraryIfNeeded](self, "_queue_loadBundleLibraryIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "contentsOfDirectoryAtPath:error:", v4, 0);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
    v34 = v4;
    v35 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_uuidToBundleMap, "objectForKey:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (id)v12;
          v14 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v11;
            _os_log_impl(&dword_2499A5000, v14, OS_LOG_TYPE_DEFAULT, "Do not migrate directory %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v39 = 0;
          objc_msgSend(v4, "stringByAppendingPathComponent:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v15, &v39);
          v18 = v39;

          if (v17)
            v19 = v18 == 0;
          else
            v19 = 1;
          if (v19)
          {
            v20 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v45 = v11;
              _os_log_impl(&dword_2499A5000, v20, OS_LOG_TYPE_DEFAULT, "Do not migrate file %{public}@", buf, 0xCu);
            }
            v13 = 0;
          }
          else
          {
            if (-[UNCBundleLibrarian _isUUIDString:](self, "_isUUIDString:", v11))
            {
              v21 = *v5;
              if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v45 = v15;
                _os_log_error_impl(&dword_2499A5000, v21, OS_LOG_TYPE_ERROR, "Removing %{public}@ as it is a stale notification source", buf, 0xCu);
              }
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = 0;
              v23 = objc_msgSend(v22, "removeItemAtPath:error:", v15, &v38);
              v24 = v38;

              if ((v23 & 1) == 0)
              {
                v25 = *MEMORY[0x24BDF89B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v45 = v15;
                  v46 = 2114;
                  v47 = v24;
                  _os_log_error_impl(&dword_2499A5000, v25, OS_LOG_TYPE_ERROR, "Could not remove %{public}@ in cleanup after library migration error: %{public}@", buf, 0x16u);
                }
              }

              v13 = 0;
            }
            else
            {
              v13 = v11;
              -[UNCBundleLibrarian _queue_uniqueIdentifierForBundleIdentifier:](self, "_queue_uniqueIdentifierForBundleIdentifier:", v13);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = *v5;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v45 = v13;
                v46 = 2114;
                v47 = v26;
                _os_log_impl(&dword_2499A5000, v27, OS_LOG_TYPE_DEFAULT, "Migrate directory from %{public}@ to %{public}@", buf, 0x16u);
              }
              objc_msgSend(v4, "stringByAppendingPathComponent:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = 0;
              v30 = objc_msgSend(v29, "moveItemAtPath:toPath:error:", v15, v28, &v37);
              v31 = v37;

              if ((v30 & 1) == 0)
              {
                v32 = *MEMORY[0x24BDF89B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v45 = v15;
                  v46 = 2114;
                  v47 = v28;
                  v48 = 2114;
                  v49 = v31;
                  _os_log_error_impl(&dword_2499A5000, v32, OS_LOG_TYPE_ERROR, "Could not move %{public}@ to %{public}@ as a part of library migration error: %{public}@", buf, 0x20u);
                }
              }

              v4 = v34;
            }
            v5 = (os_log_t *)MEMORY[0x24BDF89B8];
          }

          v9 = v35;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v8);
  }

}

- (void)_removeBundleLibrary
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__UNCBundleLibrarian__removeBundleLibrary__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __42__UNCBundleLibrarian__removeBundleLibrary__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = a1 + 32;
  if (objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(v4 + 8)))
  {
    v5 = *(_QWORD *)(*(_QWORD *)v3 + 8);
    v8 = 0;
    v6 = objc_msgSend(v2, "removeItemAtPath:error:", v5, &v8);
    v7 = v8;
    if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
      __42__UNCBundleLibrarian__removeBundleLibrary__block_invoke_cold_1();

  }
}

- (void)_queue_loadBundleLibrary
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *bundleToUUIDMap;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *uuidToBundleMap;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  id v16;

  -[UNCBundleLibrarian _queue_dictionaryAtPath:](self, "_queue_dictionaryAtPath:", self->_bundleLibraryPath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableDictionary *)objc_msgSend(v3, "mutableCopy");
  bundleToUUIDMap = self->_bundleToUUIDMap;
  self->_bundleToUUIDMap = v4;

  v6 = self->_bundleToUUIDMap;
  if (v6)
  {
    -[NSMutableDictionary allKeys](v6, "allKeys");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v7 = self->_bundleToUUIDMap;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectsForKeys:notFoundMarker:](v7, "objectsForKeys:notFoundMarker:", v16, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjects:forKeys:", v16, v9);
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    uuidToBundleMap = self->_uuidToBundleMap;
    self->_uuidToBundleMap = v10;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = self->_bundleToUUIDMap;
    self->_bundleToUUIDMap = v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v15 = self->_uuidToBundleMap;
    self->_uuidToBundleMap = v14;

    -[UNCBundleLibrarian _queue_saveDictionary:atPath:](self, "_queue_saveDictionary:atPath:", self->_bundleToUUIDMap, self->_bundleLibraryPath);
  }
}

- (void)_queue_addEntryForBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  NSMutableDictionary *bundleToUUIDMap;
  id v7;
  id v8;

  bundleToUUIDMap = self->_bundleToUUIDMap;
  v7 = a4;
  v8 = a3;
  -[NSMutableDictionary setObject:forKey:](bundleToUUIDMap, "setObject:forKey:", v7, v8);
  -[NSMutableDictionary setObject:forKey:](self->_uuidToBundleMap, "setObject:forKey:", v8, v7);

  -[UNCBundleLibrarian _queue_saveDictionary:atPath:](self, "_queue_saveDictionary:atPath:", self->_bundleToUUIDMap, self->_bundleLibraryPath);
}

- (void)_queue_removeEntryForBundleIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCBundleLibrarian _queue_uniqueIdentifierForBundleIdentifier:](self, "_queue_uniqueIdentifierForBundleIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_bundleToUUIDMap, "removeObjectForKey:", v4);

  -[NSMutableDictionary removeObjectForKey:](self->_uuidToBundleMap, "removeObjectForKey:", v5);
  -[UNCBundleLibrarian _queue_saveDictionary:atPath:](self, "_queue_saveDictionary:atPath:", self->_bundleToUUIDMap, self->_bundleLibraryPath);

}

- (id)_queue_dictionaryAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[UNCBundleLibrarian _queue_dataAtPath:](self, "_queue_dataAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x24BDD1620];
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = (void *)*MEMORY[0x24BDF89B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
        -[UNCBundleLibrarian _queue_dictionaryAtPath:].cold.1(v11, (uint64_t)v10, (uint64_t)v4);

      goto LABEL_7;
    }
  }
LABEL_8:

  return v10;
}

- (id)_queue_dataAtPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v7;

  v3 = a3;
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (!v4 && os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
    -[UNCBundleLibrarian _queue_dataAtPath:].cold.1();

  return v4;
}

- (BOOL)_queue_saveDictionary:(id)a3 atPath:(id)a4
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  BOOL v19;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x24BDF89B8];
  v8 = (void *)*MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138543618;
    v25 = v6;
    v26 = 2048;
    v27 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "Saving file at %{public}@ with %lu items", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "fileExistsAtPath:", v11) & 1) == 0)
  {
    v23 = 0;
    v12 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v23);
    v13 = v23;
    if ((v12 & 1) == 0 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      -[UNCBundleLibrarian _queue_saveDictionary:atPath:].cold.4();

  }
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  v16 = v15;
  if (v14)
  {
    v21 = v15;
    v17 = objc_msgSend(v14, "writeToFile:options:error:", v6, 268435457, &v21);
    v18 = v21;

    if ((v17 & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        -[UNCBundleLibrarian _queue_saveDictionary:atPath:].cold.2();
      v19 = 0;
    }
    v16 = v18;
  }
  else
  {
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      -[UNCBundleLibrarian _queue_saveDictionary:atPath:].cold.1();
    v19 = 0;
  }

  return v19;
}

- (BOOL)_isUUIDString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  return v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uuidToBundleMap, 0);
  objc_storeStrong((id *)&self->_bundleToUUIDMap, 0);
  objc_storeStrong((id *)&self->_bundleLibraryPath, 0);
}

void __62__UNCBundleLibrarian_migrateLibraryFromDirectory_toDirectory___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Could not remove %{public}@ in cleanup after library migration error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __42__UNCBundleLibrarian__removeBundleLibrary__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Could not remove bundle library at %{public}@; error: %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)_queue_dictionaryAtPath:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v7 = 138543618;
  v8 = (id)objc_opt_class();
  v9 = 2114;
  v10 = a3;
  v5 = v8;
  OUTLINED_FUNCTION_2(&dword_2499A5000, v4, v6, "Unexpected class %{public}@ decocded at %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1();
}

- (void)_queue_dictionaryAtPath:(void *)a1 .cold.2(void *a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = *MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = a2;
    v8 = 2114;
    v9 = v3;
    OUTLINED_FUNCTION_2(&dword_2499A5000, v4, v5, "Exception caught data at %{public}@; exception: %{public}@",
      (uint8_t *)&v6);
  }

  objc_end_catch();
  OUTLINED_FUNCTION_1();
}

- (void)_queue_dataAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "No data found at %{public}@: %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)_queue_saveDictionary:atPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Could not encode object data at %{public}@: %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)_queue_saveDictionary:atPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Could not write objects to %{public}@; error: %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)_queue_saveDictionary:(uint64_t)a3 atPath:.cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = objc_begin_catch(a1);
  v5 = *MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = a3;
    v9 = 2114;
    v10 = v4;
    OUTLINED_FUNCTION_2(&dword_2499A5000, v5, v6, "Unable to archive objects at %{public}@: %{public}@", (uint8_t *)&v7);
  }

  objc_end_catch();
  OUTLINED_FUNCTION_1();
}

- (void)_queue_saveDictionary:atPath:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Could not create directory at %{public}@; error: %{public}@");
  OUTLINED_FUNCTION_6();
}

@end
