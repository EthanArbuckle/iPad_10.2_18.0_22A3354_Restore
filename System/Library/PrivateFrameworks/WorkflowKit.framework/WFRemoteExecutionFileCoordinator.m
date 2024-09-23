@implementation WFRemoteExecutionFileCoordinator

- (WFRemoteExecutionFileCoordinator)init
{
  WFRemoteExecutionFileCoordinator *v2;
  uint64_t v3;
  NSMutableDictionary *waitingFiles;
  uint64_t v5;
  NSHashTable *waitingArchivers;
  WFRemoteExecutionFileCoordinator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFRemoteExecutionFileCoordinator;
  v2 = -[WFRemoteExecutionFileCoordinator init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    waitingFiles = v2->_waitingFiles;
    v2->_waitingFiles = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    waitingArchivers = v2->_waitingArchivers;
    v2->_waitingArchivers = (NSHashTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)handleFile:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  WFRemoteExecutionFileCoordinator *v28;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v28 = self;
  -[WFRemoteExecutionFileCoordinator waitingArchivers](self, "waitingArchivers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v9)
  {
    v10 = v9;
    v30 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v12, "transferIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v36 != v16)
                objc_enumerationMutation(v13);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "isEqualToString:", v7))
              {
                objc_msgSend(v12, "setFileURL:", v6);
                objc_msgSend(v12, "fileAvailabilityChanged");
                objc_msgSend(v8, "addObject:", v12);
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          }
          while (v15);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v8, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k);
          -[WFRemoteExecutionFileCoordinator waitingArchivers](v28, "waitingArchivers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v20);
    }
    goto LABEL_28;
  }
  -[WFRemoteExecutionFileCoordinator waitingFiles](v28, "waitingFiles");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "containsObject:", v7);

  if ((v27 & 1) == 0)
  {
    -[WFRemoteExecutionFileCoordinator waitingFiles](v28, "waitingFiles");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v6, v7);
LABEL_28:

  }
}

- (void)registerArchiver:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "transferIdentifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        -[WFRemoteExecutionFileCoordinator waitingFiles](self, "waitingFiles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[WFRemoteExecutionFileCoordinator waitingFiles](self, "waitingFiles");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setFileURL:", v14);

          objc_msgSend(v4, "fileAvailabilityChanged");
          -[WFRemoteExecutionFileCoordinator waitingFiles](self, "waitingFiles");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObjectForKey:", v10);

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[WFRemoteExecutionFileCoordinator waitingArchivers](self, "waitingArchivers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);
LABEL_11:

}

- (NSMutableDictionary)waitingFiles
{
  return self->_waitingFiles;
}

- (void)setWaitingFiles:(id)a3
{
  objc_storeStrong((id *)&self->_waitingFiles, a3);
}

- (NSHashTable)waitingArchivers
{
  return self->_waitingArchivers;
}

- (void)setWaitingArchivers:(id)a3
{
  objc_storeStrong((id *)&self->_waitingArchivers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingArchivers, 0);
  objc_storeStrong((id *)&self->_waitingFiles, 0);
}

@end
