@implementation BYPreferencesController

- (id)objectForKey:(id)a3 includeCache:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  _QWORD block[5];
  __CFString *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a4;
  v6 = (__CFString *)a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  if (!v4)
    goto LABEL_4;
  -[BYPreferencesController queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__BYPreferencesController_objectForKey_includeCache___block_invoke;
  block[3] = &unk_1E4E27748;
  v15 = &v16;
  block[4] = self;
  v14 = v6;
  dispatch_sync(v7, block);

  v8 = (void *)v17[5];
  if (v8)
  {
    v9 = v8;
  }
  else
  {
LABEL_4:
    -[BYPreferencesController domain](self, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[BYPreferencesController domain](self, "domain");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = (id)CFPreferencesCopyValue(v6, v11, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);

    }
    else
    {
      v9 = 0;
    }
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (NSString)domain
{
  return self->_domain;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  char v4;

  -[BYPreferencesController objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

void __53__BYPreferencesController_objectForKey_includeCache___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)preferences
{
  return self->_preferences;
}

+ (id)buddyPreferencesInternal
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__BYPreferencesController_buddyPreferencesInternal__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buddyPreferencesInternal_onceToken != -1)
    dispatch_once(&buddyPreferencesInternal_onceToken, block);
  return (id)buddyPreferencesInternal_preferences;
}

- (id)objectForKey:(id)a3
{
  return -[BYPreferencesController objectForKey:includeCache:](self, "objectForKey:includeCache:", a3, 1);
}

+ (id)buddyPreferences
{
  if (buddyPreferences_onceToken != -1)
    dispatch_once(&buddyPreferences_onceToken, &__block_literal_global_13);
  return (id)buddyPreferences_preferences;
}

void __43__BYPreferencesController_buddyPreferences__block_invoke()
{
  BYPreferencesController *v0;
  void *v1;

  v0 = -[BYPreferencesController initWithDomain:]([BYPreferencesController alloc], "initWithDomain:", CFSTR("com.apple.purplebuddy"));
  v1 = (void *)buddyPreferences_preferences;
  buddyPreferences_preferences = (uint64_t)v0;

}

+ (id)buddyPreferencesExcludedFromBackup
{
  if (buddyPreferencesExcludedFromBackup_onceToken != -1)
    dispatch_once(&buddyPreferencesExcludedFromBackup_onceToken, &__block_literal_global_4_0);
  return (id)buddyPreferencesExcludedFromBackup_preferences;
}

void __61__BYPreferencesController_buddyPreferencesExcludedFromBackup__block_invoke()
{
  BYPreferencesController *v0;
  void *v1;

  v0 = -[BYPreferencesController initWithDomain:]([BYPreferencesController alloc], "initWithDomain:", CFSTR("com.apple.purplebuddy.notbackedup"));
  v1 = (void *)buddyPreferencesExcludedFromBackup_preferences;
  buddyPreferencesExcludedFromBackup_preferences = (uint64_t)v0;

}

+ (id)buddyPreferencesEphemeral
{
  if (buddyPreferencesEphemeral_onceToken != -1)
    dispatch_once(&buddyPreferencesEphemeral_onceToken, &__block_literal_global_5);
  return (id)buddyPreferencesEphemeral_preferences;
}

void __52__BYPreferencesController_buddyPreferencesEphemeral__block_invoke()
{
  BYPreferencesController *v0;
  void *v1;

  v0 = objc_alloc_init(BYPreferencesController);
  v1 = (void *)buddyPreferencesEphemeral_preferences;
  buddyPreferencesEphemeral_preferences = (uint64_t)v0;

}

void __51__BYPreferencesController_buddyPreferencesInternal__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (os_variant_has_internal_ui())
  {
    objc_msgSend((id)objc_opt_class(), "buddyPreferences");
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)buddyPreferencesInternal_preferences;
    buddyPreferencesInternal_preferences = v0;

  }
}

+ (id)genericPreferencesEphemeral
{
  return objc_alloc_init((Class)a1);
}

+ (id)randomPreferences
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithDomain:", v4);

  return v5;
}

- (BYPreferencesController)init
{
  BYPreferencesController *v2;
  id v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BYPreferencesController;
  v2 = -[BYPreferencesController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[BYPreferencesController setPreferences:](v2, "setPreferences:", v3);

    v4 = dispatch_queue_create("Preferences Queue", 0);
    -[BYPreferencesController setQueue:](v2, "setQueue:", v4);

  }
  return v2;
}

- (BYPreferencesController)initWithDomain:(id)a3
{
  id v4;
  BYPreferencesController *v5;
  BYPreferencesController *v6;

  v4 = a3;
  v5 = -[BYPreferencesController init](self, "init");
  v6 = v5;
  if (v5)
    -[BYPreferencesController setDomain:](v5, "setDomain:", v4);

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[BYPreferencesController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__BYPreferencesController_setObject_forKey___block_invoke;
  block[3] = &unk_1E4E27770;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __44__BYPreferencesController_setObject_forKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)setObject:(id)a3 forKey:(id)a4 persistImmediately:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v8;
  __CFString *v9;
  id value;

  v5 = a5;
  value = a3;
  v8 = (__CFString *)a4;
  -[BYPreferencesController setObject:forKey:](self, "setObject:forKey:", value, v8);
  if (v5)
  {
    -[BYPreferencesController domain](self, "domain");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetValue(v8, value, v9, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);

  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[BYPreferencesController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__BYPreferencesController_removeObjectForKey___block_invoke;
  block[3] = &unk_1E4E27798;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __46__BYPreferencesController_removeObjectForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)removeObjectForKey:(id)a3 onlyFromMemory:(BOOL)a4
{
  void *v6;
  __CFString *v7;
  __CFString *key;

  key = (__CFString *)a3;
  -[BYPreferencesController removeObjectForKey:](self, "removeObjectForKey:");
  if (!a4)
  {
    -[BYPreferencesController domain](self, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[BYPreferencesController domain](self, "domain");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFPreferencesSetValue(key, 0, v7, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);

    }
  }

}

- (void)reset
{
  NSObject *v3;
  _QWORD block[5];

  -[BYPreferencesController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__BYPreferencesController_reset__block_invoke;
  block[3] = &unk_1E4E26958;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __32__BYPreferencesController_reset__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (void)persist
{
  NSObject *v3;
  _QWORD block[5];

  -[BYPreferencesController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__BYPreferencesController_persist__block_invoke;
  block[3] = &unk_1E4E26958;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __34__BYPreferencesController_persist__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v9 = (const __CFString *)*MEMORY[0x1E0C9B250];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v11 = *(const __CFString **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "preferences", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "domain");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        CFPreferencesSetValue(v11, v13, v14, v8, v9);

        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

+ (void)persistEverything
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "buddyPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persist");

  objc_msgSend((id)objc_opt_class(), "buddyPreferencesExcludedFromBackup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persist");

  objc_msgSend((id)objc_opt_class(), "buddyPreferencesInternal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persist");

}

- (void)flush
{
  id v2;

  -[BYPreferencesController domain](self, "domain");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _CFPreferencesFlushCachesForIdentifier();

}

+ (void)flushEverything
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "buddyPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

  objc_msgSend((id)objc_opt_class(), "buddyPreferencesExcludedFromBackup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flush");

  objc_msgSend((id)objc_opt_class(), "buddyPreferencesInternal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flush");

}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
