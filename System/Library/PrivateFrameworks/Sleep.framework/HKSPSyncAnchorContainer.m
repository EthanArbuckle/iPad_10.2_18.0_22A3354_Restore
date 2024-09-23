@implementation HKSPSyncAnchorContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingDictionary, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __47__HKSPSyncAnchorContainer_updateWithContainer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)objc_opt_class(), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "syncAnchorForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lock_updateSyncAnchor:forKey:", v9, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)syncAnchorForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__HKSPSyncAnchorContainer_syncAnchorForKey___block_invoke;
  v8[3] = &unk_1E4E3AF20;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[HKSPSyncAnchorContainer _withLock:](self, "_withLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

void __44__HKSPSyncAnchorContainer_syncAnchorForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "lock_syncAnchorForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)lock_updateSyncAnchor:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    -[HKSPSyncAnchorContainer lock_syncAnchorForKey:](self, "lock_syncAnchorForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || objc_msgSend(v7, "compare:", v9) == -1)
      -[HKSPSyncAnchorContainer lock_setSyncAnchor:forKey:](self, "lock_setSyncAnchor:forKey:", v9, v6);

  }
}

- (id)lock_getSyncAnchorForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_backingDictionary, "objectForKeyedSubscript:", a3);
}

- (void)lock_setSyncAnchor:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copyWithZone:", 0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backingDictionary, "setObject:forKeyedSubscript:", v7, v6);

}

void __65__HKSPSyncAnchorContainer_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "lock_syncAnchorForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "descriptionForKey:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id)objc_msgSend(v8, "appendObject:withName:", v9, v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

+ (id)descriptionForKey:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SleepScheduleSyncAnchor")) & 1) != 0)
  {
    v4 = CFSTR("schedule");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SleepSettingsSyncAnchor")) & 1) != 0)
  {
    v4 = CFSTR("settings");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SleepRecordSyncAnchor")) & 1) != 0)
  {
    v4 = CFSTR("record");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SleepStateSyncAnchor")) & 1) != 0)
  {
    v4 = CFSTR("state");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SleepModeSyncAnchor")) & 1) != 0)
  {
    v4 = CFSTR("mode");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SleepEventSyncAnchor")))
  {
    v4 = CFSTR("event");
  }
  else
  {
    v4 = &stru_1E4E3E220;
  }

  return (id)v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSyncAnchorContainer identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("id"));

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPSyncAnchorContainer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allKeys
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SleepScheduleSyncAnchor");
  v3[1] = CFSTR("SleepSettingsSyncAnchor");
  v3[2] = CFSTR("SleepRecordSyncAnchor");
  v3[3] = CFSTR("SleepStateSyncAnchor");
  v3[4] = CFSTR("SleepModeSyncAnchor");
  v3[5] = CFSTR("SleepEventSyncAnchor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __40__HKSPSyncAnchorContainer_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "mutableCopy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

}

void __43__HKSPSyncAnchorContainer_encodeWithCoder___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("identifier"));
  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "copy");
  objc_msgSend(v2, "encodeObject:forKey:", v3, CFSTR("dictionary"));

}

- (NSString)description
{
  return (NSString *)-[HKSPSyncAnchorContainer descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_1E4E3E220);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSyncAnchorContainer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSyncAnchorContainer identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, CFSTR("id"), 1);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__HKSPSyncAnchorContainer_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E4E3A760;
  v11[4] = self;
  v7 = v4;
  v12 = v7;
  -[HKSPSyncAnchorContainer _withLock:](self, "_withLock:", v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (HKSPSyncAnchorContainer)initWithCoder:(id)a3
{
  id v4;
  HKSPSyncAnchorContainer *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *backingDictionary;
  HKSPSyncAnchorContainer *v14;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKSPSyncAnchorContainer;
  v5 = -[HKSPSyncAnchorContainer init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = HKSPSyncAnchorClass();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("dictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");
    backingDictionary = v5->_backingDictionary;
    v5->_backingDictionary = (NSMutableDictionary *)v12;

    v14 = v5;
  }

  return v5;
}

- (HKSPSyncAnchorContainer)initWithIdentifier:(id)a3
{
  id v5;
  HKSPSyncAnchorContainer *v6;
  HKSPSyncAnchorContainer *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *backingDictionary;
  HKSPSyncAnchorContainer *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPSyncAnchorContainer;
  v6 = -[HKSPSyncAnchorContainer init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backingDictionary = v7->_backingDictionary;
    v7->_backingDictionary = v8;

    v10 = v7;
  }

  return v7;
}

- (void)updateWithContainer:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HKSPSyncAnchorContainer_updateWithContainer___block_invoke;
  v6[3] = &unk_1E4E3A760;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKSPSyncAnchorContainer _withLock:](self, "_withLock:", v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  HKSPSyncAnchorContainer *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__HKSPSyncAnchorContainer_copyWithZone___block_invoke;
  v8[3] = &unk_1E4E3A760;
  v5 = v4;
  v9 = v5;
  v10 = self;
  -[HKSPSyncAnchorContainer _withLock:](self, "_withLock:", v8);
  v6 = v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HKSPSyncAnchorContainer *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__HKSPSyncAnchorContainer_encodeWithCoder___block_invoke;
  v6[3] = &unk_1E4E3A760;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[HKSPSyncAnchorContainer _withLock:](self, "_withLock:", v6);

}

- (void)updateSyncAnchor:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HKSPSyncAnchorContainer_updateSyncAnchor_forKey___block_invoke;
  v10[3] = &unk_1E4E3CB08;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[HKSPSyncAnchorContainer _withLock:](self, "_withLock:", v10);

}

uint64_t __51__HKSPSyncAnchorContainer_updateSyncAnchor_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lock_updateSyncAnchor:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)lock_removeSyncAnchorForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_backingDictionary, "removeObjectForKey:", a3);
}

- (id)incrementSyncAnchorForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__HKSPSyncAnchorContainer_incrementSyncAnchorForKey___block_invoke;
  v8[3] = &unk_1E4E3AF20;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[HKSPSyncAnchorContainer _withLock:](self, "_withLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __53__HKSPSyncAnchorContainer_incrementSyncAnchorForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "lock_incrementSyncAnchorForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)lock_incrementSyncAnchorForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKSPSyncAnchorContainer lock_getSyncAnchorForKey:](self, "lock_getSyncAnchorForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hksp_increment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSyncAnchorContainer lock_setSyncAnchor:forKey:](self, "lock_setSyncAnchor:forKey:", v6, v4);

  return v6;
}

- (HKSPSyncAnchor)sleepScheduleSyncAnchor
{
  return (HKSPSyncAnchor *)-[HKSPSyncAnchorContainer syncAnchorForKey:](self, "syncAnchorForKey:", CFSTR("SleepScheduleSyncAnchor"));
}

- (HKSPSyncAnchor)sleepSettingsSyncAnchor
{
  return (HKSPSyncAnchor *)-[HKSPSyncAnchorContainer syncAnchorForKey:](self, "syncAnchorForKey:", CFSTR("SleepSettingsSyncAnchor"));
}

- (HKSPSyncAnchor)sleepEventRecordSyncAnchor
{
  return (HKSPSyncAnchor *)-[HKSPSyncAnchorContainer syncAnchorForKey:](self, "syncAnchorForKey:", CFSTR("SleepRecordSyncAnchor"));
}

- (HKSPSyncAnchor)sleepScheduleStateSyncAnchor
{
  return (HKSPSyncAnchor *)-[HKSPSyncAnchorContainer syncAnchorForKey:](self, "syncAnchorForKey:", CFSTR("SleepStateSyncAnchor"));
}

- (HKSPSyncAnchor)sleepModeSyncAnchor
{
  return (HKSPSyncAnchor *)-[HKSPSyncAnchorContainer syncAnchorForKey:](self, "syncAnchorForKey:", CFSTR("SleepModeSyncAnchor"));
}

- (HKSPSyncAnchor)sleepEventSyncAnchor
{
  return (HKSPSyncAnchor *)-[HKSPSyncAnchorContainer syncAnchorForKey:](self, "syncAnchorForKey:", CFSTR("SleepEventSyncAnchor"));
}

- (void)compareWithContainer:(id)a3 sleepScheduleSyncAnchorOutOfDate:(id)a4 sleepSettingsSyncAnchorOutOfDate:(id)a5 sleepEventRecordSyncAnchorOutOfDate:(id)a6 sleepScheduleStateSyncAnchorOutOfDate:(id)a7 sleepModeSyncAnchorOutOfDate:(id)a8 sleepEventSyncAnchorOutOfDate:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  _QWORD v37[6];
  _QWORD v38[8];

  v38[6] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_msgSend(v14, "copy");
  v37[0] = CFSTR("SleepScheduleSyncAnchor");
  v22 = (void *)MEMORY[0x1A85ABD18](v20);

  v38[0] = v22;
  v37[1] = CFSTR("SleepSettingsSyncAnchor");
  v23 = (void *)MEMORY[0x1A85ABD18](v19);

  v38[1] = v23;
  v37[2] = CFSTR("SleepRecordSyncAnchor");
  v24 = (void *)MEMORY[0x1A85ABD18](v18);

  v38[2] = v24;
  v37[3] = CFSTR("SleepModeSyncAnchor");
  v25 = (void *)MEMORY[0x1A85ABD18](v16);

  v38[3] = v25;
  v37[4] = CFSTR("SleepStateSyncAnchor");
  v26 = (void *)MEMORY[0x1A85ABD18](v17);

  v38[4] = v26;
  v37[5] = CFSTR("SleepEventSyncAnchor");
  v27 = (void *)MEMORY[0x1A85ABD18](v15);

  v38[5] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __247__HKSPSyncAnchorContainer_compareWithContainer_sleepScheduleSyncAnchorOutOfDate_sleepSettingsSyncAnchorOutOfDate_sleepEventRecordSyncAnchorOutOfDate_sleepScheduleStateSyncAnchorOutOfDate_sleepModeSyncAnchorOutOfDate_sleepEventSyncAnchorOutOfDate___block_invoke;
  v33[3] = &unk_1E4E3CB30;
  v33[4] = self;
  v34 = v21;
  v35 = v14;
  v36 = v28;
  v29 = v28;
  v30 = v14;
  v31 = v21;
  -[HKSPSyncAnchorContainer _withLock:](self, "_withLock:", v33);

}

void __247__HKSPSyncAnchorContainer_compareWithContainer_sleepScheduleSyncAnchorOutOfDate_sleepSettingsSyncAnchorOutOfDate_sleepEventRecordSyncAnchorOutOfDate_sleepScheduleStateSyncAnchorOutOfDate_sleepModeSyncAnchorOutOfDate_sleepEventSyncAnchorOutOfDate___block_invoke(id *a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  __int128 v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend((id)objc_opt_class(), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v20;
    *(_QWORD *)&v3 = 138544386;
    v16 = v3;
    do
    {
      v6 = 0;
      v17 = v4;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v6);
        objc_msgSend(a1[5], "syncAnchorForKey:", v7, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "lock_syncAnchorForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8 || objc_msgSend(v8, "compare:", v9) == -1)
        {
          HKSPLogForCategory(0xAuLL);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(a1[4], "succinctDescription");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[6], "succinctDescription");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "descriptionForKey:", v7);
            v13 = v5;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v16;
            v24 = v11;
            v25 = 2114;
            v26 = v12;
            v27 = 2114;
            v28 = v14;
            v29 = 2114;
            v30 = v8;
            v31 = 2114;
            v32 = v9;
            _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ container %{public}@ has out of date %{public}@ sync anchor (%{public}@ vs %{public}@)", buf, 0x34u);

            v5 = v13;
            v4 = v17;

          }
          objc_msgSend(a1[7], "objectForKeyedSubscript:", v7);
          v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v15)[2](v15, v9);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
    }
    while (v4);
  }

}

- (void)updateSleepScheduleSyncAnchor:(id)a3
{
  -[HKSPSyncAnchorContainer updateSyncAnchor:forKey:](self, "updateSyncAnchor:forKey:", a3, CFSTR("SleepScheduleSyncAnchor"));
}

- (void)updateSleepSettingsSyncAnchor:(id)a3
{
  -[HKSPSyncAnchorContainer updateSyncAnchor:forKey:](self, "updateSyncAnchor:forKey:", a3, CFSTR("SleepSettingsSyncAnchor"));
}

- (void)updateSleepEventRecordSyncAnchor:(id)a3
{
  -[HKSPSyncAnchorContainer updateSyncAnchor:forKey:](self, "updateSyncAnchor:forKey:", a3, CFSTR("SleepRecordSyncAnchor"));
}

- (void)updateSleepScheduleStateSyncAnchor:(id)a3
{
  -[HKSPSyncAnchorContainer updateSyncAnchor:forKey:](self, "updateSyncAnchor:forKey:", a3, CFSTR("SleepStateSyncAnchor"));
}

- (void)updateSleepModeSyncAnchor:(id)a3
{
  -[HKSPSyncAnchorContainer updateSyncAnchor:forKey:](self, "updateSyncAnchor:forKey:", a3, CFSTR("SleepModeSyncAnchor"));
}

- (void)updateSleepEventSyncAnchor:(id)a3
{
  -[HKSPSyncAnchorContainer updateSyncAnchor:forKey:](self, "updateSyncAnchor:forKey:", a3, CFSTR("SleepEventSyncAnchor"));
}

- (id)incrementSleepScheduleSyncAnchor
{
  return -[HKSPSyncAnchorContainer incrementSyncAnchorForKey:](self, "incrementSyncAnchorForKey:", CFSTR("SleepScheduleSyncAnchor"));
}

- (id)incrementSleepSettingsSyncAnchor
{
  return -[HKSPSyncAnchorContainer incrementSyncAnchorForKey:](self, "incrementSyncAnchorForKey:", CFSTR("SleepSettingsSyncAnchor"));
}

- (id)incrementSleepEventRecordSyncAnchor
{
  return -[HKSPSyncAnchorContainer incrementSyncAnchorForKey:](self, "incrementSyncAnchorForKey:", CFSTR("SleepRecordSyncAnchor"));
}

- (id)incrementSleepScheduleStateSyncAnchor
{
  return -[HKSPSyncAnchorContainer incrementSyncAnchorForKey:](self, "incrementSyncAnchorForKey:", CFSTR("SleepStateSyncAnchor"));
}

- (id)incrementSleepModeSyncAnchor
{
  return -[HKSPSyncAnchorContainer incrementSyncAnchorForKey:](self, "incrementSyncAnchorForKey:", CFSTR("SleepModeSyncAnchor"));
}

- (id)incrementSleepEventSyncAnchor
{
  return -[HKSPSyncAnchorContainer incrementSyncAnchorForKey:](self, "incrementSyncAnchorForKey:", CFSTR("SleepEventSyncAnchor"));
}

- (void)forceSetSleepScheduleSyncAnchor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HKSPSyncAnchorContainer *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HKSPSyncAnchorContainer_forceSetSleepScheduleSyncAnchor___block_invoke;
  v6[3] = &unk_1E4E3A760;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[HKSPSyncAnchorContainer _withLock:](self, "_withLock:", v6);

}

uint64_t __59__HKSPSyncAnchorContainer_forceSetSleepScheduleSyncAnchor___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v1, "lock_setSyncAnchor:forKey:", v2, CFSTR("SleepScheduleSyncAnchor"));
  else
    return objc_msgSend(v1, "lock_removeSyncAnchorForKey:", CFSTR("SleepScheduleSyncAnchor"));
}

@end
