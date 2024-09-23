@implementation SBDaemonHandler

void __50__SBDaemonHandler_addRequest_forKey_forDaemonPid___block_invoke(uint64_t a1)
{
  void *v2;
  SBDaemonContext *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__daemonsByPid, "objectForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [SBDaemonContext alloc];
    v4 = -[SBDaemonContext initWithPid:queue:](v3, "initWithPid:queue:", *(unsigned int *)(a1 + 56), __queue);
    if (!v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_5;
    }
    v2 = (void *)v4;
    objc_msgSend((id)__daemonsByPid, "setObject:forKey:", v4, v5);
  }
  objc_msgSend(v2, "addRequest:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

LABEL_5:
}

+ (BOOL)addRequest:(id)a3 forKey:(id)a4 forDaemonPid:(int)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v7 = a3;
  v8 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v9 = __queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__SBDaemonHandler_addRequest_forKey_forDaemonPid___block_invoke;
  v13[3] = &unk_1E8EB18D8;
  v17 = a5;
  v15 = v8;
  v16 = &v18;
  v14 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_sync(v9, v13);
  LOBYTE(v9) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v9;
}

+ (void)removeRequestForKey:(id)a3 forDaemonPid:(int)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  int v10;

  v5 = a3;
  v6 = __queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SBDaemonHandler_removeRequestForKey_forDaemonPid___block_invoke;
  block[3] = &unk_1E8EA1BB8;
  v10 = a4;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __52__SBDaemonHandler_removeRequestForKey_forDaemonPid___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__daemonsByPid, "objectForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "removeRequestForKey:", *(_QWORD *)(a1 + 32));

}

+ (void)noteDaemonCanceled:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "pid"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__daemonsByPid, "removeObjectForKey:", v3);

}

+ (void)initialize
{
  if (initialize___once != -1)
    dispatch_once(&initialize___once, &__block_literal_global_188);
}

void __29__SBDaemonHandler_initialize__block_invoke()
{
  id v0;
  void *v1;
  uint64_t Serial;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)__daemonsByPid;
  __daemonsByPid = (uint64_t)v0;

  Serial = BSDispatchQueueCreateSerial();
  v3 = (void *)__queue;
  __queue = Serial;

}

+ (id)stateDescription
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__64;
  v9 = __Block_byref_object_dispose__64;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBDaemonHandler_stateDescription__block_invoke;
  block[3] = &unk_1E8E9ED40;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__queue, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__SBDaemonHandler_stateDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)__daemonsByPid, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_5_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)__daemonsByPid, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBDaemonHandler state -> %@"), v4);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

uint64_t __35__SBDaemonHandler_stateDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(a2, "pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "pid");

  objc_msgSend(v7, "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

@end
