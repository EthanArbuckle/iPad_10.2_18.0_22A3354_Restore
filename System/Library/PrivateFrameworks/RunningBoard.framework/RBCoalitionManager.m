@implementation RBCoalitionManager

- (RBCoalitionManager)initWithAdapter:(id)a3
{
  id v5;
  RBCoalitionManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *lock_coalitions;
  RBProcessMap *v9;
  RBProcessMap *lock_processes;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RBCoalitionManager;
  v6 = -[RBCoalitionManager init](&v12, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    lock_coalitions = v6->_lock_coalitions;
    v6->_lock_coalitions = v7;

    v9 = objc_alloc_init(RBProcessMap);
    lock_processes = v6->_lock_processes;
    v6->_lock_processes = v9;

    objc_storeStrong((id *)&v6->_adapter, a3);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)didUpdateProcessStates:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  RBCoalitionKernelAdapting *adapter;
  uint64_t v22;
  os_unfair_lock_t lock;
  id v24;
  NSMutableDictionary *obj;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "hasChanges"))
  {
    lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v24 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v43 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v9, "identity", lock);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBProcessMap valueForIdentity:](self->_lock_processes, "valueForIdentity:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v9, "updatedState");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "jetsamCoalitionID"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](self->_lock_coalitions, "objectForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setProcess:withState:", v11, v12);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v6);
    }

    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
    v38 = 0u;
    obj = self->_lock_coalitions;
    v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(obj);
          -[NSMutableDictionary objectForKey:](self->_lock_coalitions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j), lock);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0;
          v35 = &v34;
          v36 = 0x2020000000;
          v37 = 0;
          v30 = 0;
          v31 = &v30;
          v32 = 0x2020000000;
          v33 = 0;
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __45__RBCoalitionManager_didUpdateProcessStates___block_invoke;
          v26[3] = &unk_24DD47008;
          v19 = v18;
          v27 = v19;
          v28 = &v30;
          v29 = &v34;
          objc_msgSend(v19, "enumerateProcessesUsingBlock:", v26);
          if (*((_BYTE *)v35 + 24))
          {
            v20 = v31[3];
            if (v20 != objc_msgSend(v19, "coalitionLevel"))
            {
              adapter = self->_adapter;
              v22 = objc_msgSend(v19, "coalitionID");
              if (!-[RBCoalitionKernelAdapting applyCoalitionWithID:coalitionLevel:](adapter, "applyCoalitionWithID:coalitionLevel:", v22, v31[3]))objc_msgSend(v19, "setCoalitionLevel:", v31[3]);
            }
          }

          _Block_object_dispose(&v30, 8);
          _Block_object_dispose(&v34, 8);

        }
        v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v15);
    }

    os_unfair_lock_unlock(lock);
    v4 = v24;
  }

}

void __45__RBCoalitionManager_didUpdateProcessStates___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "coalitionLevel");
  rbs_process_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)a1[4];
    v12 = 138413058;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v11;
    v18 = 2048;
    v19 = objc_msgSend(v11, "coalitionID");
    _os_log_debug_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEBUG, "Process: %@ with state: %@ for coalition: %@ with coalitionID: %llu", (uint8_t *)&v12, 0x2Au);
  }

  if (v7)
  {
    v9 = *(_QWORD *)(a1[5] + 8);
    v10 = *(_QWORD *)(v9 + 24);
    if (v7 > v10)
      v10 = v7;
    *(_QWORD *)(v9 + 24) = v10;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (void)addProcess:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  RBCoalition *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  RBCoalition *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v9 = -[RBProcessMap containsIdentity:](self->_lock_processes, "containsIdentity:", v8);
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "pid");

    if (-[RBCoalitionKernelAdapting coalitionInfoForPID:outCoalitionInfo:](self->_adapter, "coalitionInfoForPID:outCoalitionInfo:", v11, &v19) < 0)
    {
      rbs_process_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[RBCoalitionManager addProcess:withState:].cold.1(v11, v13);
    }
    else
    {
      objc_msgSend(v6, "setResourceCoalitionID:", v19);
      objc_msgSend(v6, "setJetsamCoalitionID:", v20);
      objc_msgSend(v6, "setJetsamCoalitionLeader:", v21);
      v12 = v20;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v20);
      v13 = objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary objectForKey:](self->_lock_coalitions, "objectForKey:", v13);
      v14 = (RBCoalition *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        rbs_process_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v23 = v12;
          v24 = 1024;
          LODWORD(v25) = v11;
          _os_log_impl(&dword_21A8B4000, v15, OS_LOG_TYPE_DEFAULT, "Creating new RBCoalition with coalition ID: %llu for PID %d", buf, 0x12u);
        }

        v14 = -[RBCoalition initWithCoalitionID:]([RBCoalition alloc], "initWithCoalitionID:", v12);
        -[NSMutableDictionary setObject:forKey:](self->_lock_coalitions, "setObject:forKey:", v14, v13);
      }
      rbs_process_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = -[RBCoalition coalitionID](v14, "coalitionID");
        *(_DWORD *)buf = 138413058;
        v23 = v6;
        v24 = 2112;
        v25 = v14;
        v26 = 2048;
        v27 = v17;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_21A8B4000, v16, OS_LOG_TYPE_DEFAULT, "Adding process: %@ to coalition: %@ with coalitionID: %llu with state: %@", buf, 0x2Au);
      }

      -[RBCoalition setProcess:withState:](v14, "setProcess:withState:", v6, v7);
      v18 = -[RBProcessMap setValue:forIdentity:](self->_lock_processes, "setValue:forIdentity:", v6, v8);
      os_unfair_lock_unlock(&self->_lock);

    }
  }

}

- (void)removeProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "jetsamCoalitionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_coalitions, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    rbs_process_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412802;
      v13 = v4;
      v14 = 2112;
      v15 = (uint64_t)v7;
      v16 = 2048;
      v17 = objc_msgSend(v7, "coalitionID");
      _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEFAULT, "Removing process: %@ from coalition: %@ with coalitionID: %llu", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(v7, "removeProcess:", v4);
    if (objc_msgSend(v7, "isEmpty"))
    {
      rbs_process_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(v7, "coalitionID");
        v12 = 138412546;
        v13 = v7;
        v14 = 2048;
        v15 = v10;
        _os_log_impl(&dword_21A8B4000, v9, OS_LOG_TYPE_DEFAULT, "Removing the coalition: %@ with coalitionID: %llu as all the processes in this coalition have been removed", (uint8_t *)&v12, 0x16u);
      }

      -[NSMutableDictionary removeObjectForKey:](self->_lock_coalitions, "removeObjectForKey:", v6);
    }
  }
  v11 = -[RBProcessMap removeValueForIdentity:](self->_lock_processes, "removeValueForIdentity:", v5);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)captureState
{
  void *v3;
  void *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  RBProcessMap *lock_processes;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v3 = (void *)objc_opt_new();
  -[RBCoalitionManager stateCaptureTitle](self, "stateCaptureTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:\n"), v4);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_opt_new();
  lock_processes = self->_lock_processes;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __34__RBCoalitionManager_captureState__block_invoke;
  v11[3] = &unk_24DD47030;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  -[RBProcessMap enumerateWithBlock:](lock_processes, "enumerateWithBlock:", v11);
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_14);
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n>\n"), v9);

  os_unfair_lock_unlock(p_lock);
  return v3;
}

void __34__RBCoalitionManager_captureState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v6, "jetsamCoalitionID"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "pid");
  objc_msgSend(v7, "shortDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v8, "coalitionID");
  v14 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v8, "creationTime");
  objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "coalitionLevel");
  v17 = objc_msgSend(v8, "previousCoalitionLevel");
  v18 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v8, "lastModificationTime");
  objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("\t%d : %@ : coalitionID:%llu, creationTime: %@, coalitionLevel:%llu, previous:%llu, lastModTime: %@"), v11, v12, v13, v15, v16, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
}

uint64_t __34__RBCoalitionManager_captureState__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_lock_processes, 0);
  objc_storeStrong((id *)&self->_lock_coalitions, 0);
}

- (void)addProcess:(int)a1 withState:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Kernel failed to return coalition info for PID %d", (uint8_t *)v2, 8u);
}

@end
