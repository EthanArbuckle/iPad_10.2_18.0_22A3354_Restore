@implementation RBThrottleBestEffortNetworkingManager

- (void)didUpdateProcessStates:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  RBProcessMap *stateMap;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "updatedState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "originalState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "throttleBestEffortNetworking");
        v13 = objc_msgSend(v10, "throttleBestEffortNetworking");

        if (v12 != v13)
        {
          objc_msgSend(v9, "identity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v10, "throttleBestEffortNetworking");
          stateMap = self->_stateMap;
          if (v15)
          {
            v17 = (void *)objc_msgSend(v10, "copy");
            v18 = -[RBProcessMap setValue:forIdentity:](stateMap, "setValue:forIdentity:", v17, v14);

          }
          else
          {
            -[RBProcessMap removeIdentity:](self->_stateMap, "removeIdentity:", v14);
          }

          v6 = 1;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
    if ((v6 & 1) != 0)
      -[RBThrottleBestEffortNetworkingManager _updateThrottleBestEffortNetworking]((uint64_t)self);
  }

}

- (void)addProcess:(id)a3
{
  -[RBProcessIndex addProcess:](self->_processIndex, "addProcess:", a3);
  -[RBThrottleBestEffortNetworkingManager _updateThrottleBestEffortNetworking]((uint64_t)self);
}

- (void)_updateThrottleBestEffortNetworking
{
  os_unfair_lock_s *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t *v7;
  NSObject *v8;
  _QWORD block[4];
  int v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v3 = *(void **)(a1 + 24);
    v4 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke;
    v11[3] = &unk_24DD46590;
    v11[4] = a1;
    v11[5] = &v12;
    objc_msgSend(v3, "enumerateWithBlock:", v11);
    if (*((unsigned __int8 *)v13 + 24) != *(unsigned __int8 *)(a1 + 32))
    {
      rbs_best_effort_networking_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (*((_BYTE *)v13 + 24))
          v6 = "enabled";
        else
          v6 = "disabled";
        *(_DWORD *)buf = 136315138;
        v17 = v6;
        _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "Throttle best effort networking set to %s", buf, 0xCu);
      }

      v7 = v13;
      *(_BYTE *)(a1 + 32) = *((_BYTE *)v13 + 24);
      LODWORD(v7) = *((unsigned __int8 *)v7 + 24);
      v8 = *(NSObject **)(a1 + 8);
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_9;
      block[3] = &__block_descriptor_36_e5_v8__0l;
      v10 = (int)v7;
      dispatch_async(v8, block);
    }
    os_unfair_lock_unlock(v2);
    _Block_object_dispose(&v12, 8);
  }
}

- (void)removeProcess:(id)a3
{
  -[RBProcessIndex removeProcess:](self->_processIndex, "removeProcess:", a3);
  -[RBThrottleBestEffortNetworkingManager _updateThrottleBestEffortNetworking]((uint64_t)self);
}

- (RBThrottleBestEffortNetworkingManager)init
{
  RBThrottleBestEffortNetworkingManager *v2;
  RBThrottleBestEffortNetworkingManager *v3;
  RBProcessMap *v4;
  RBProcessMap *stateMap;
  RBProcessIndex *v6;
  RBProcessIndex *processIndex;
  uint64_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RBThrottleBestEffortNetworkingManager;
  v2 = -[RBThrottleBestEffortNetworkingManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(RBProcessMap);
    stateMap = v3->_stateMap;
    v3->_stateMap = v4;

    v6 = objc_alloc_init(RBProcessIndex);
    processIndex = v3->_processIndex;
    v3->_processIndex = v6;

    v3->_throttleBestEffortNetworking = 0;
    v8 = objc_msgSend(MEMORY[0x24BE80D58], "createBackgroundQueue:", CFSTR("RBThrottleBestEffortNetworkingManager"));
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

  }
  return v3;
}

- (BOOL)isThrottleBestEffortNetworkingEnabled
{
  RBThrottleBestEffortNetworkingManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_throttleBestEffortNetworking;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessMap dictionary](self->_stateMap, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entriesToStringWithIndent:debug:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| process states:{\n\t%@\n\t}>"), v4, v6);

  return (NSString *)v7;
}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

uint64_t __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsIdentity:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_9(uint64_t a1)
{
  NSObject *v1;

  if (sysctlbyname("kern.ipc.throttle_best_effort", 0, 0, (void *)(a1 + 32), 4uLL) && *__error() != 2)
  {
    rbs_best_effort_networking_log();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_9_cold_1(v1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMap, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_9_cold_1(NSObject *a1)
{
  int v2;
  int *v3;
  char *v4;
  _DWORD v5[2];
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *__error();
  v3 = __error();
  v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  v6 = 2080;
  v7 = v4;
  _os_log_error_impl(&dword_21A8B4000, a1, OS_LOG_TYPE_ERROR, "Error applying throttle best effort with error %d: %s", (uint8_t *)v5, 0x12u);
}

@end
