@implementation VMUProcList

- (VMUProcList)init
{
  VMUProcList *v2;
  uint64_t v3;
  NSLock *procLock;
  uint64_t v5;
  NSMutableDictionary *allProcs;
  uint64_t v7;
  NSMutableDictionary *filteredProcs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VMUProcList;
  v2 = -[VMUProcList init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    procLock = v2->procLock;
    v2->procLock = (NSLock *)v3;

    v5 = objc_opt_new();
    allProcs = v2->allProcs;
    v2->allProcs = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    filteredProcs = v2->filteredProcs;
    v2->filteredProcs = (NSMutableDictionary *)v7;

    -[VMUProcList updateFromSystem](v2, "updateFromSystem");
  }
  return v2;
}

- (void)setProcInfos:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *allProcs;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSLock lock](self->procLock, "lock");
  -[NSMutableDictionary removeAllObjects](self->allProcs, "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        allProcs = self->allProcs;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "pid", (_QWORD)v13));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](allProcs, "setObject:forKeyedSubscript:", v10, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSLock unlock](self->procLock, "unlock");
  -[VMUProcList update](self, "update");

}

- (void)addProcInfo:(id)a3
{
  NSLock *procLock;
  id v5;
  NSMutableDictionary *allProcs;
  void *v7;

  procLock = self->procLock;
  v5 = a3;
  -[NSLock lock](procLock, "lock");
  allProcs = self->allProcs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](allProcs, "setObject:forKeyedSubscript:", v5, v7);

  -[NSLock unlock](self->procLock, "unlock");
  -[VMUProcList update](self, "update");
}

- (void)removeProcInfo:(id)a3
{
  NSLock *procLock;
  id v5;
  NSMutableDictionary *allProcs;
  void *v7;
  uint64_t v8;
  void *v9;

  procLock = self->procLock;
  v5 = a3;
  -[NSLock lock](procLock, "lock");
  allProcs = self->allProcs;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "pid");

  objc_msgSend(v7, "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](allProcs, "removeObjectForKey:", v9);

  -[NSLock unlock](self->procLock, "unlock");
  -[VMUProcList update](self, "update");
}

- (BOOL)update
{
  void *v3;
  NSMutableDictionary *allProcs;
  NSMutableDictionary *v5;
  NSMutableDictionary *filteredProcs;
  NSMutableDictionary *v7;
  _QWORD v9[4];
  NSMutableDictionary *v10;

  -[NSLock lock](self->procLock, "lock");
  v3 = (void *)objc_opt_new();
  allProcs = self->allProcs;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __21__VMUProcList_update__block_invoke;
  v9[3] = &unk_1E4E01E48;
  v5 = v3;
  v10 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](allProcs, "enumerateKeysAndObjectsUsingBlock:", v9);
  LODWORD(allProcs) = -[NSMutableDictionary isEqualToDictionary:](v5, "isEqualToDictionary:", self->filteredProcs) ^ 1;
  filteredProcs = self->filteredProcs;
  self->filteredProcs = v5;
  v7 = v5;

  -[NSLock unlock](self->procLock, "unlock");
  return (char)allProcs;
}

uint64_t __21__VMUProcList_update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (void)_populateFromSystem
{
  void *v3;
  pid_t v4;
  NSMutableDictionary *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  VMUProcInfo *v15;
  NSMutableDictionary *allProcs;
  NSMutableDictionary *v17;
  void *context;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A85A9758](self, a2);
  +[VMUProcInfo getProcessIds](VMUProcInfo, "getProcessIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = getpid();
  v5 = (NSMutableDictionary *)objc_opt_new();
  -[NSLock lock](self->procLock, "lock");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "unsignedIntValue");
        if ((_DWORD)v12)
          v13 = (_DWORD)v12 == v4;
        else
          v13 = 1;
        if (!v13)
        {
          v14 = v12;
          -[NSMutableDictionary objectForKeyedSubscript:](self->allProcs, "objectForKeyedSubscript:", v11);
          v15 = (VMUProcInfo *)objc_claimAutoreleasedReturnValue();
          if (!v15)
            v15 = -[VMUProcInfo initWithPid:]([VMUProcInfo alloc], "initWithPid:", v14);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  allProcs = self->allProcs;
  self->allProcs = v5;
  v17 = v5;

  -[NSLock unlock](self->procLock, "unlock");
  objc_autoreleasePoolPop(context);
}

- (BOOL)updateFromSystem
{
  -[VMUProcList _populateFromSystem](self, "_populateFromSystem");
  return -[VMUProcList update](self, "update");
}

- (unint64_t)count
{
  unint64_t v3;

  -[NSLock lock](self->procLock, "lock");
  v3 = -[NSMutableDictionary count](self->filteredProcs, "count");
  -[NSLock unlock](self->procLock, "unlock");
  return v3;
}

- (id)allProcInfos
{
  void *v3;

  -[NSLock lock](self->procLock, "lock");
  -[NSMutableDictionary allValues](self->filteredProcs, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->procLock, "unlock");
  return v3;
}

- (id)allPIDs
{
  void *v3;

  -[NSLock lock](self->procLock, "lock");
  -[NSMutableDictionary allKeys](self->filteredProcs, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->procLock, "unlock");
  return v3;
}

- (id)allNames
{
  void *v3;
  NSMutableDictionary *filteredProcs;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->procLock, "lock");
  filteredProcs = self->filteredProcs;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __23__VMUProcList_allNames__block_invoke;
  v7[3] = &unk_1E4E01E48;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](filteredProcs, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[NSLock unlock](self->procLock, "unlock");

  return v5;
}

void __23__VMUProcList_allNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (id)allPathNames
{
  void *v3;
  NSMutableDictionary *filteredProcs;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->procLock, "lock");
  filteredProcs = self->filteredProcs;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__VMUProcList_allPathNames__block_invoke;
  v7[3] = &unk_1E4E01E48;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](filteredProcs, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[NSLock unlock](self->procLock, "unlock");

  return v5;
}

void __27__VMUProcList_allPathNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "realAppName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (id)newestProcInfo
{
  return -[VMUProcList newestProcInfoWithName:](self, "newestProcInfoWithName:", 0);
}

- (id)newestProcInfoWithName:(id)a3
{
  id v4;
  pid_t v5;
  NSMutableDictionary *filteredProcs;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  _QWORD *v16;
  pid_t v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3010000000;
  v18[4] = 0;
  v18[5] = 0;
  v18[3] = &unk_1A4E39779;
  v5 = getpid();
  -[NSLock lock](self->procLock, "lock");
  filteredProcs = self->filteredProcs;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __38__VMUProcList_newestProcInfoWithName___block_invoke;
  v13 = &unk_1E4E01E70;
  v17 = v5;
  v7 = v4;
  v14 = v7;
  v15 = &v19;
  v16 = v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](filteredProcs, "enumerateKeysAndObjectsUsingBlock:", &v10);
  -[NSLock unlock](self->procLock, "unlock", v10, v11, v12, v13);
  v8 = (id)v20[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

void __38__VMUProcList_newestProcInfoWithName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v5 = objc_msgSend(v17, "startTime");
  v7 = v6;
  if (objc_msgSend(v17, "pid") != *(_DWORD *)(a1 + 56))
  {
    v8 = *(void **)(a1 + 32);
    if (!v8
      || (objc_msgSend(v17, "name"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "isEqualToString:", v9),
          v9,
          v10))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(_QWORD *)(v11 + 40);
      v12 = (id *)(v11 + 40);
      if (!v13
        || (v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), v15 = *(_QWORD *)(v14 + 32), v5 > v15)
        || v5 == v15 && *(_DWORD *)(v14 + 40) < (int)v7)
      {
        objc_storeStrong(v12, a3);
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        *(_QWORD *)(v16 + 32) = v5;
        *(_QWORD *)(v16 + 40) = v7;
      }
    }
  }

}

- (id)procInfoWithPID:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *filteredProcs;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  -[NSLock lock](self->procLock, "lock");
  filteredProcs = self->filteredProcs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](filteredProcs, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->procLock, "unlock");
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->filteredProcs, 0);
  objc_storeStrong((id *)&self->allProcs, 0);
  objc_storeStrong((id *)&self->procLock, 0);
}

@end
