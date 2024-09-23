@implementation RBProcess

- (RBSProcessIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)isLifecycleManaged
{
  return self->_manageFlags & 1;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (BOOL)isSystem
{
  return 0;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (NSString)description
{
  return self->_shortDescription;
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (RBSAuditToken)auditToken
{
  return self->_auditToken;
}

- (id)_initThinWithInstance:(id)a3 auditToken:(id)a4 bundleProperties:(id)a5 jetsamProperties:(id)a6 hostProcess:(id)a7 properties:(id)a8
{
  return -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:](self, a3, a4, a5, a6, 0, a7, a8, 0, 0);
}

- (RBSProcessInstance)instance
{
  return self->_instance;
}

- (BOOL)isReported
{
  return self->_manageFlags != 0;
}

- (void)_lock_applySuspendState
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 109) & 1) != 0)
    {
      v4 = *(void **)(a1 + 56);
      if (v4)
        v5 = objc_msgSend(v4, "preventSuspend");
      else
        v5 = 0;
      v6 = objc_msgSend(*(id *)(a1 + 64), "preventSuspend");
      if (!*(_QWORD *)(a1 + 56) || v5 != v6)
      {
        if (v6)
          -[RBProcess _lock_resume](a1);
        else
          -[RBProcess _lock_suspend](a1);
      }
    }
    else
    {
      rbs_process_log();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v7 = 138543362;
        v8 = v3;
        _os_log_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring suspend because this process is not lifecycle managed", (uint8_t *)&v7, 0xCu);
      }

    }
  }
}

- (RBSProcessHandle)handle
{
  return self->_handle;
}

- (void)_applyState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[RBProcess processStateApplicationQueue](RBProcess, "processStateApplicationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __25__RBProcess__applyState___block_invoke;
  v8[3] = &unk_24DD45FF0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async(v5, v7);

}

+ (id)processStateApplicationQueue
{
  if (processStateApplicationQueue_onceToken != -1)
    dispatch_once(&processStateApplicationQueue_onceToken, &__block_literal_global_7);
  return (id)processStateApplicationQueue_queue;
}

- (BOOL)isTestApp
{
  int isTestApp;
  void *v4;
  int v5;

  isTestApp = self->_isTestApp;
  if (!isTestApp)
  {
    if (os_variant_has_internal_content())
    {
      -[RBProcess rbs_pid](self, "rbs_pid");
      RBSExecutablePathForPID();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "hasPrefix:", CFSTR("/AppleInternal/Tests/RunningBoard/")))
        v5 = 1;
      else
        v5 = -1;
      self->_isTestApp = v5;

      isTestApp = self->_isTestApp;
    }
    else
    {
      isTestApp = -1;
      self->_isTestApp = -1;
    }
  }
  return isTestApp == 1;
}

- (void)_lock_applyMemoryLimits
{
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "shortDescription");
  objc_claimAutoreleasedReturnValue();
  v2 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_7(v2);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_7(&dword_21A8B4000, v3, v4, "Could not get Memory Limits for %{public}@ - failed with error: %s (%d)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_4();
}

- (int)rbs_pid
{
  return -[RBSProcessIdentifier pid](self->_identifier, "pid");
}

- (RBJetsamProperties)memoryLimits
{
  os_unfair_lock_s *p_dataLock;
  RBJetsamProperties *v4;
  RBJetsamProperties *memoryLimits;
  NSObject *v6;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  if (!self->_memoryLimits)
  {
    if ((self->_manageFlags & 8) != 0)
    {
      rbs_assertion_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[RBProcess memoryLimits].cold.1((uint64_t)self, v6);

    }
    else
    {
      v4 = (RBJetsamProperties *)objc_opt_new();
      memoryLimits = self->_memoryLimits;
      self->_memoryLimits = v4;

    }
  }
  os_unfair_lock_unlock(p_dataLock);
  return self->_memoryLimits;
}

- (char)_initWithInstance:(void *)a3 auditToken:(void *)a4 bundleProperties:(void *)a5 jetsamProperties:(void *)a6 initialState:(void *)a7 hostProcess:(void *)a8 properties:(char)a9 systemPreventsIdleSleep:(char)a10 cache:
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void **v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id *v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  int v57;
  int v58;
  char isKindOfClass;
  NSObject *v60;
  _BOOL4 v61;
  uint64_t v62;
  const char *v63;
  NSObject *v64;
  uint32_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id obj;
  id v77;
  id v78;
  id v79;
  id v80;
  char v81;
  objc_super v82;
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  uint64_t v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v18 = a2;
  obj = a3;
  v19 = a3;
  v20 = a4;
  v80 = a5;
  v79 = a6;
  v78 = a7;
  v21 = a8;
  if (!a1)
  {
    v23 = 0;
LABEL_36:
    v69 = v79;
    v68 = v80;
    v70 = v78;
    goto LABEL_37;
  }
  if (v18)
  {
    if (v19)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithInstance_auditToken_bundleProperties_jetsamProperties_initialState_hostProcess_properties_systemPreventsIdleSleep_cache_, a1, CFSTR("RBProcess.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instance"));

    if (v19)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithInstance_auditToken_bundleProperties_jetsamProperties_initialState_hostProcess_properties_systemPreventsIdleSleep_cache_, a1, CFSTR("RBProcess.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auditToken"));

LABEL_4:
  objc_msgSend(v18, "identity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "osServiceType") == 1)
    -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:].cold.1();

  v82.receiver = a1;
  v82.super_class = (Class)RBProcess;
  v23 = (char *)objc_msgSendSuper2(&v82, sel_init);
  if (!v23)
    goto LABEL_36;
  *((_DWORD *)v23 + 2) = objc_msgSend(v18, "rbs_pid");
  objc_storeStrong((id *)v23 + 18, a2);
  objc_msgSend(v18, "identifier");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)*((_QWORD *)v23 + 17);
  *((_QWORD *)v23 + 17) = v24;

  objc_msgSend(v18, "identity");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)*((_QWORD *)v23 + 2);
  *((_QWORD *)v23 + 2) = v26;

  *((_QWORD *)v23 + 15) = 0;
  objc_msgSend(v21, "homeDirectory");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)*((_QWORD *)v23 + 25);
  *((_QWORD *)v23 + 25) = v28;

  objc_msgSend(v21, "tmpDirectory");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)*((_QWORD *)v23 + 26);
  *((_QWORD *)v23 + 26) = v30;

  *((_DWORD *)v23 + 21) = objc_msgSend(v19, "pidversion");
  v32 = (void **)(v23 + 88);
  objc_storeStrong((id *)v23 + 11, a5);
  v77 = v19;
  if (objc_msgSend(v21, "doesOverrideManagement"))
  {
    v33 = v20;
    v34 = objc_msgSend(v21, "overrideManageFlags");
LABEL_13:
    v23[109] = v34;
    goto LABEL_18;
  }
  if (!objc_msgSend(*((id *)v23 + 2), "isExtension"))
  {
    v33 = v20;
    v34 = objc_msgSend(*((id *)v23 + 2), "defaultManageFlags");
    goto LABEL_13;
  }
  objc_msgSend(v20, "extensionPointIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    if (objc_msgSend(MEMORY[0x24BE80C98], "shouldManageExtensionWithExtensionPoint:", v35))
      v23[109] = -1;
  }
  else
  {
    rbs_process_log();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:].cold.2();

  }
  v33 = v20;

  v34 = v23[109];
LABEL_18:
  if ((v34 & 8) == 0)
  {
    v36 = objc_opt_new();
    v37 = *v32;
    *v32 = (void *)v36;

  }
  objc_msgSend(v21, "managedEndpointByLaunchIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "copy");
  v40 = (void *)*((_QWORD *)v23 + 27);
  *((_QWORD *)v23 + 27) = v39;

  objc_storeStrong((id *)v23 + 21, a4);
  v23[77] = objc_msgSend(v33, "usesSocketMonitoring");
  v41 = objc_alloc_init(MEMORY[0x24BE80C60]);
  v42 = (void *)*((_QWORD *)v23 + 19);
  *((_QWORD *)v23 + 19) = v41;

  *((_QWORD *)v23 + 6) = 0;
  v23[78] = a9;
  objc_storeStrong((id *)v23 + 5, a7);
  v43 = objc_alloc(MEMORY[0x24BE80C78]);
  v44 = *((_QWORD *)v23 + 18);
  v45 = v23[109];
  objc_msgSend(v21, "beforeTranslocationBundlePath");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "executablePath");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v72) = a10;
  v48 = objc_msgSend(v43, "initWithInstance:auditToken:bundleData:manageFlags:beforeTranslocationBundlePath:executablePath:cache:", v44, v77, v33, v45, v46, v47, v72);
  v49 = (void *)*((_QWORD *)v23 + 3);
  *((_QWORD *)v23 + 3) = v48;

  v50 = (id *)(v23 + 176);
  objc_storeStrong((id *)v23 + 22, obj);
  v51 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(*((id *)v23 + 2), "shortDescription");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v51, "initWithFormat:", CFSTR("[%@:%d]"), v52, objc_msgSend(*((id *)v23 + 17), "rbs_pid"));
  v54 = (void *)*((_QWORD *)v23 + 4);
  *((_QWORD *)v23 + 4) = v53;

  objc_msgSend(v21, "underlyingAssertion");
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)*((_QWORD *)v23 + 23);
  *((_QWORD *)v23 + 23) = v55;

  v81 = 2;
  v57 = objc_msgSend(*((id *)v23 + 11), "memoryLimitForCategory:strength:", *MEMORY[0x24BE80E08], &v81);
  v81 = 2;
  v58 = objc_msgSend(*((id *)v23 + 11), "memoryLimitForCategory:strength:", *MEMORY[0x24BE80E10], &v81);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  rbs_process_log();
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
  if ((isKindOfClass & 1) != 0)
  {
    if (v61)
    {
      v62 = *((_QWORD *)v23 + 4);
      *(_DWORD *)buf = 138543362;
      v84 = v62;
      v63 = "%{public}@ is not RunningBoard jetsam managed.";
      v64 = v60;
      v65 = 12;
LABEL_25:
      _os_log_impl(&dword_21A8B4000, v64, OS_LOG_TYPE_DEFAULT, v63, buf, v65);
    }
  }
  else if (v61)
  {
    v66 = *((_QWORD *)v23 + 4);
    v67 = *((_QWORD *)v23 + 11);
    *(_DWORD *)buf = 138544130;
    v84 = v66;
    v85 = 1024;
    v86 = v57;
    v87 = 1024;
    v88 = v58;
    v89 = 2112;
    v90 = v67;
    v63 = "%{public}@ Memory Limits: active %d inactive %d\n %@";
    v64 = v60;
    v65 = 34;
    goto LABEL_25;
  }

  v20 = v33;
  v19 = v77;
  if (*v50)
  {
    objc_msgSend(*v50, "realToken");
    v23[76] = RBSAuditTokenRepresentsPlatformBinary();
  }
  -[RBProcess _setMemoryStatusFlags:]((uint64_t)v23, v21);
  v69 = v79;
  v68 = v80;
  v70 = v78;
  if (v79 && *((_QWORD *)v23 + 23) && !objc_msgSend(*((id *)v23 + 8), "memoryLimit"))
    objc_msgSend(v23, "_applyState:", v79);
LABEL_37:

  return v23;
}

- (void)_setMemoryStatusFlags:(uint64_t)a1
{
  id v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = *(_BYTE *)(a1 + 109);
    rbs_process_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if ((v4 & 8) != 0)
    {
      if (v6)
      {
        v8 = *(_QWORD *)(a1 + 32);
        v12 = 138543362;
        v13 = v8;
        _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ This process will be managed.", (uint8_t *)&v12, 0xCu);
      }

      -[RBProcess _memoryStatusControl:flags:](a1);
      if ((objc_msgSend(*(id *)(a1 + 88), "isFreezerEligible") & 1) == 0)
      {
        rbs_process_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412290;
          v13 = a1;
          _os_log_impl(&dword_21A8B4000, v9, OS_LOG_TYPE_DEFAULT, "%@ is not freezer eligible, disabling freezing.", (uint8_t *)&v12, 0xCu);
        }

        -[RBProcess _memoryStatusControl:flags:](a1);
      }
      if ((_deviceSupportsAppSwapping & 1) == 0
        && objc_msgSend(*(id *)(a1 + 16), "isApplication")
        && -[RBProcess _memoryStatusControl:flags:](a1) == 45)
      {
        rbs_process_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = 138543362;
          v13 = v11;
          _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Device does not support app swapping - will not attempt again.", (uint8_t *)&v12, 0xCu);
        }

        _deviceSupportsAppSwapping = 1;
      }
    }
    else
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        v12 = 138543362;
        v13 = v7;
        _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ This process will not be managed.", (uint8_t *)&v12, 0xCu);
      }

    }
  }

}

- (uint64_t)_memoryStatusControl:(uint64_t)a1 flags:
{
  uint64_t v1;
  NSObject *v2;

  if (!a1)
    return 0;
  v1 = memorystatus_control();
  if ((_DWORD)v1 && *__error() != 3 && *__error() != 45)
  {
    rbs_process_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[RBProcess _memoryStatusControl:flags:].cold.1();

  }
  return v1;
}

- (NSString)environment
{
  return 0;
}

- (BOOL)isPlatformBinary
{
  return self->_platformBinary;
}

void __25__RBProcess__applyState___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  -[RBProcess _lock_applyCurrentStateIfPossible](*(_QWORD *)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)_lock_applyCurrentStateIfPossible
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  _os_log_debug_impl(&dword_21A8B4000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ ignoring process state change because process is terminating", v1, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)_lock_logVisibility
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "inheritances");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allNamespaces");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x24BE80EA0]);

    if (*(unsigned __int8 *)(a1 + 108) != v4)
    {
      rbs_ttl_log();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v6)
        {
          v7 = *(_QWORD *)(a1 + 32);
          v10 = 138543362;
          v11 = v7;
          v8 = "%{public}@ visiblity is yes";
LABEL_8:
          _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
        }
      }
      else if (v6)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = 138543362;
        v11 = v9;
        v8 = "%{public}@ visiblity is no";
        goto LABEL_8;
      }

      *(_BYTE *)(a1 + 108) = v4;
    }
  }
}

- (void)_lock_applyRole
{
  int *v5;
  uint64_t v6;
  uint8_t v7[18];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  OUTLINED_FUNCTION_22();
  v5 = __error();
  OUTLINED_FUNCTION_7(v5);
  OUTLINED_FUNCTION_24();
  v8 = 2114;
  v9 = a2;
  v10 = 2080;
  v11 = v6;
  _os_log_error_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_ERROR, "%{public}@ Error %d setting priority to %{public}@: %s", v7, 0x26u);
  OUTLINED_FUNCTION_1_4();
}

- (void)_lock_applyJetsamLenientMode
{
  int v2;
  int v3;

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 56), "effectiveJetsamLenientMode");
    v3 = objc_msgSend(*(id *)(a1 + 64), "effectiveJetsamLenientMode");
    if (v2 != v3)
      -[RBProcess _applyJetsamLenientModeState:](a1, v3);
  }
}

- (void)_lock_applyGPU
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = __error();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_0_7(&dword_21A8B4000, v1, v2, "%d Error setting Darwin GPU to \"%{public}s\": %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_4();
}

- (void)_lock_applyCPULimits
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v18;
  BOOL v19;
  int v20;
  int v23[6];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 109) & 0x10) != 0)
    {
      v4 = objc_msgSend(*(id *)(a1 + 56), "effectiveMaxCPUPercentage");
      v5 = objc_msgSend(*(id *)(a1 + 56), "effectiveMaxCPUDuration");
      v6 = objc_msgSend(*(id *)(a1 + 56), "effectiveMinCPUPercentage");
      v7 = objc_msgSend(*(id *)(a1 + 56), "effectiveMinCPUDuration");
      if (v7 <= v5)
        v8 = v5;
      else
        v8 = v7;
      if (v6 <= v4)
        v9 = v4;
      else
        v9 = v6;
      v10 = objc_msgSend(*(id *)(a1 + 64), "effectiveMaxCPUPercentage");
      v11 = objc_msgSend(*(id *)(a1 + 64), "effectiveMaxCPUDuration");
      LODWORD(v12) = objc_msgSend(*(id *)(a1 + 64), "effectiveMinCPUPercentage");
      v13 = objc_msgSend(*(id *)(a1 + 64), "effectiveMinCPUDuration");
      if ((int)v13 <= (int)v11)
        v14 = v11;
      else
        v14 = v13;
      if ((int)v12 <= v10)
        v12 = v10;
      else
        v12 = v12;
      v15 = objc_msgSend(*(id *)(a1 + 56), "effectiveMaxCPUUsageViolationPolicy", v12 | (v14 << 32));
      v16 = objc_msgSend(*(id *)(a1 + 64), "effectiveMaxCPUUsageViolationPolicy");
      v18 = v9 > 0 && v8 > 0;
      v19 = (int)v12 <= 0 || (int)v14 <= 0;
      v20 = !v19;
      if (!v19)
        v18 = 1;
      if (v9 == (_DWORD)v12 && v8 == (_DWORD)v14 && v15 == v16)
        v18 = 0;
      if (v18 || !*(_QWORD *)(a1 + 56))
      {
        -[RBProcess _lock_disableCPULimits](a1);
        if (v20)
          -[RBProcess _lock_setCPULimits:violationPolicy:](a1, v23);
        else
          -[RBProcess _lock_restoreCPULimitDefaults](a1);
        -[RBProcess _lock_resumeCPUMonitoring](a1);
      }
    }
    else
    {
      rbs_process_log();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v23[0] = 138543362;
        *(_QWORD *)&v23[1] = v3;
        _os_log_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_INFO, "%{public}@ Ignoring CPU limits because this process is not CPU limit managed", (uint8_t *)v23, 0xCu);
      }

    }
  }
}

- (void)_lock_applyJetsamPriority
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  int v7;
  uint64_t v8;
  int *v9;
  char *v10;
  uint64_t v11;
  int v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 109) & 8) == 0)
    {
      rbs_process_log();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v14 = v3;
        v4 = "%{public}@ Ignoring jetsam update because this process is not memory-managed";
        v5 = v2;
        v6 = 12;
LABEL_13:
        _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, v4, buf, v6);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    v7 = objc_msgSend(*(id *)(a1 + 64), "explicitJetsamBand");
    if (!*(_QWORD *)(a1 + 56) || *(_DWORD *)(a1 + 72) != v7)
    {
      *(_DWORD *)(a1 + 72) = v7;
      v12 = v7;
      if (memorystatus_control())
      {
        if (*__error() == 3)
          return;
        rbs_process_log();
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 32);
          v9 = __error();
          v10 = strerror(*v9);
          *(_DWORD *)buf = 138544130;
          v14 = v8;
          v15 = 1024;
          v16 = v12;
          v17 = 2048;
          v18 = 0;
          v19 = 2080;
          v20 = v10;
          _os_log_error_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Error setting jetsam priority to %d [%#llx]: %s", buf, 0x26u);
        }
        goto LABEL_14;
      }
      rbs_process_log();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        v14 = v11;
        v15 = 1024;
        v16 = v12;
        v17 = 2048;
        v18 = 0;
        v19 = 1024;
        LODWORD(v20) = 1;
        v4 = "%{public}@ Set jetsam priority to %d [%#llx] flag[%d]";
        v5 = v2;
        v6 = 34;
        goto LABEL_13;
      }
LABEL_14:

    }
  }
}

- (void)_lock_resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "%{public}@ spd_client_stop_monitoring_all_sockets_for_pid() returned KERN_FAILURE", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_lock_resumeCPUMonitoring
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9(&dword_21A8B4000, v0, v1, "%{public}@ Error resuming CPU monitoring: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_restoreCPULimitDefaults
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9(&dword_21A8B4000, v0, v1, "%{public}@ Error setting default CPU monitoring limits: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_disableCPULimits
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9(&dword_21A8B4000, v0, v1, "%{public}@ Error disabling CPU monitoring: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_suspend
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "%{public}@ spd_client_start_monitoring_all_sockets_for_pid() failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_lock_shutdownSocketsAndLog:(uint64_t)a1
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (pid_shutdown_sockets())
    {
      if (*__error() == 3)
        return;
      rbs_process_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[RBProcess _lock_shutdownSocketsAndLog:].cold.1(a1, v4);
    }
    else
    {
      if (!a2)
        return;
      rbs_process_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = "SVC";
        if (!*(_BYTE *)(a1 + 78))
          v6 = "ALL";
        v7 = 138543618;
        v8 = v5;
        v9 = 2080;
        v10 = v6;
        _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Shutdown sockets (%s)", (uint8_t *)&v7, 0x16u);
      }
    }

  }
}

- (id)_initWithInstance:(id)a3 auditToken:(id)a4 bundleProperties:(id)a5 jetsamProperties:(id)a6 initialState:(id)a7 hostProcess:(id)a8 properties:(id)a9 systemPreventsIdleSleep:(BOOL)a10
{
  return -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:](self, a3, a4, a5, a6, a7, a8, a9, a10, 1);
}

- (NSString)underlyingAssertion
{
  return self->_underlyingAssertion;
}

- (RBBundleProperties)bundleProperties
{
  return self->_bundleProperties;
}

- (void)setLastExitContext:(id)a3
{
  RBSProcessExitContext *v4;
  RBSProcessExitContext *lastExitContext;

  v4 = (RBSProcessExitContext *)a3;
  os_unfair_lock_lock(&self->_dataLock);
  lastExitContext = self->_lastExitContext;
  self->_lastExitContext = v4;

  os_unfair_lock_unlock(&self->_dataLock);
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (RBProcess)hostProcess
{
  return self->_hostProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_tmpDirectory, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_underlyingAssertion, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_bundleProperties, 0);
  objc_storeStrong((id *)&self->_intendedExitStatus, 0);
  objc_storeStrong((id *)&self->_lastExitContext, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_procSource, 0);
  objc_storeStrong((id *)&self->_memoryLimits, 0);
  objc_storeStrong((id *)&self->_lock_state, 0);
  objc_storeStrong((id *)&self->_lock_appliedState, 0);
  objc_storeStrong((id *)&self->_hostProcess, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (RBSProcessExitContext)lastExitContext
{
  os_unfair_lock_s *p_dataLock;
  RBSProcessExitContext *v4;
  RBSProcessExitContext *lastExitContext;
  void *v6;
  void *v7;
  RBSProcessExitContext *v8;
  RBSProcessExitContext *v9;
  RBSProcessExitContext *v10;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  if (self->_intendedExitStatus)
  {
    v4 = (RBSProcessExitContext *)-[RBSProcessExitContext copyWithStatus:](self->_lastExitContext, "copyWithStatus:");
    lastExitContext = self->_lastExitContext;
    self->_lastExitContext = v4;

  }
  if (!-[RBSProcessExitContext type](self->_lastExitContext, "type"))
  {
    -[RBSProcessIdentity consistentLaunchdJobLabel](self->_identity, "consistentLaunchdJobLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[RBLaunchdJobManager lastExitStatusForLabel:error:](RBLaunchdJobManager, "lastExitStatusForLabel:error:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (RBSProcessExitContext *)-[RBSProcessExitContext copyWithStatus:](self->_lastExitContext, "copyWithStatus:", v7);
      v9 = self->_lastExitContext;
      self->_lastExitContext = v8;

    }
  }
  v10 = self->_lastExitContext;
  os_unfair_lock_unlock(p_dataLock);
  return v10;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  RBSProcessExitContext *lastExitContext;
  void *v5;
  RBSProcessExitContext *v6;
  RBSProcessExitContext *v7;
  NSObject *v8;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[RBProcessState jetsamLenientMode](self->_lock_state, "jetsamLenientMode"))
    -[RBProcess _applyJetsamLenientModeState:]((uint64_t)self, 0);
  os_unfair_lock_lock(&self->_dataLock);
  lastExitContext = self->_lastExitContext;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (RBSProcessExitContext *)-[RBSProcessExitContext copyWithTimestamp:](lastExitContext, "copyWithTimestamp:", v5);
  v7 = self->_lastExitContext;
  self->_lastExitContext = v6;

  os_unfair_lock_unlock(&self->_dataLock);
  self->_appliedJetsamPriority = -1;
  self->_terminating = 1;
  os_unfair_lock_unlock(p_lock);
  v8 = objc_msgSend(MEMORY[0x24BE80D58], "sharedBackgroundWorkloop");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__RBProcess_invalidate__block_invoke;
  block[3] = &unk_24DD46160;
  block[4] = self;
  dispatch_async(v8, block);

}

void __26__RBProcess__lock_suspend__block_invoke(uint64_t a1)
{
  uint64_t *v1;
  void *v2;
  os_unfair_lock_s *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t *)(a1 + 32);
  -[RBProcess _allowedLockedFilePaths](*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*v1 + 48));
  v3 = (os_unfair_lock_s *)*v1;
  if (*(_BYTE *)(*v1 + 129) && !LOBYTE(v3[32]._os_unfair_lock_opaque))
  {
    rbs_process_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(*v1 + 32);
      *(_DWORD *)buf = 138543362;
      v25 = v5;
      _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ check if suspended process is holding locks", buf, 0xCu);
    }

    -[RBProcess _lock_lockedFilePathsIgnoring:](*v1, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      rbs_process_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __26__RBProcess__lock_suspend__block_invoke_cold_2();

      rbs_process_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __26__RBProcess__lock_suspend__block_invoke_cold_1();

      if (objc_msgSend(*(id *)(*v1 + 16), "platform") == 6)
      {
        rbs_process_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(void **)(*v1 + 16);
          *(_DWORD *)buf = 138412290;
          v25 = v14;
          _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_DEFAULT, "Not emitting 0xdead10cc error for process %@ suspended with locked system files because it is a Mac Catalyst app. Mac Catalyst apps should always be terminated on suspension, regardless of whether the app holds a shared file lock.", buf, 0xCu);
        }
      }
      else
      {
        v15 = objc_alloc(MEMORY[0x24BE80D40]);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ was suspended with locked system files:\n%@\nnot in allowed directories:\n%@"), *(_QWORD *)(*v1 + 32), v8, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v15, "initWithExplanation:", v16);

        -[NSObject setExceptionCode:](v13, "setExceptionCode:", 3735883980);
        -[NSObject setExceptionDomain:](v13, "setExceptionDomain:", 15);
        -[NSObject setMaximumTerminationResistance:](v13, "setMaximumTerminationResistance:", 50);
        -[NSObject setReportType:](v13, "setReportType:", 1);
        rbs_sp_telemetry_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v17))
        {
          objc_msgSend(*(id *)(*v1 + 16), "embeddedApplicationIdentifier");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v18)
          {
            v20 = 0;
            v21 = (void *)v18;
          }
          else
          {
            objc_msgSend(*(id *)(*v1 + 16), "xpcServiceIdentifier");
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v20 = 0;
              v23 = (void *)v22;
              v21 = (void *)v22;
            }
            else
            {
              objc_msgSend(*(id *)(*v1 + 16), "consistentLaunchdJobLabel");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = 0;
              v20 = 1;
            }
          }
          *(_DWORD *)buf = 138543362;
          v25 = v21;
          _os_signpost_emit_with_name_impl(&dword_21A8B4000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SuspendedWithLockedFiles", "BundleIdOverride=%{public, signpost.description:attribute}@ enableTelemetry=YES ", buf, 0xCu);
          if (v20)

          if (!v19)
        }

        -[RBProcess _lock_terminateWithContext:](*v1, v13);
      }

    }
    v3 = (os_unfair_lock_s *)*v1;
  }
  os_unfair_lock_unlock(v3 + 12);

}

- (id)_allowedLockedFilePaths
{
  os_unfair_lock_s *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uid_t v18;
  passwd *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  int v35;
  uid_t v36;
  void *v37;
  passwd *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v54;
  uid_t v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  uint8_t v63[128];
  uint8_t buf[4];
  id v65;
  __int16 v66;
  uid_t v67;
  __int16 v68;
  int v69;
  __int128 buffer;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v3 = *(id *)(a1 + 16);
    v4 = *(id *)(a1 + 200);
    v5 = *(id *)(a1 + 208);
    v6 = *(id *)(a1 + 168);
    v7 = *(id *)(a1 + 32);
    v8 = *(_DWORD *)(a1 + 8);
    os_unfair_lock_unlock(v2);
    if ((objc_msgSend(v3, "isXPCService") & 1) != 0)
    {
      v9 = 0;
LABEL_61:

      return v9;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      rbs_process_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[RBProcess _allowedLockedFilePaths].cold.7();

      objc_msgSend(v10, "addObject:", v4);
    }
    if (v5)
    {
      rbs_process_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[RBProcess _allowedLockedFilePaths].cold.6();

      objc_msgSend(v10, "addObject:", v5);
    }
    objc_msgSend(v6, "environmentVariables");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __36__RBProcess__allowedLockedFilePaths__block_invoke;
    v61[3] = &unk_24DD46840;
    v14 = v10;
    v62 = v14;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v61);

    if ((objc_msgSend(v3, "isEmbeddedApplication") & 1) == 0 && !objc_msgSend(v3, "isAngel"))
    {
LABEL_53:
      v56 = v3;
      v43 = v6;
      v44 = v5;
      v45 = v4;
      v46 = v7;
      objc_msgSend(MEMORY[0x24BDBCEF0], "set", v54);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v47 = v14;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v58 != v50)
              objc_enumerationMutation(v47);
            objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "stringByStandardizingPath");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v52);

          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
        }
        while (v49);
      }

      v7 = v46;
      v4 = v45;
      v5 = v44;
      v6 = v43;
      v3 = v56;
      goto LABEL_61;
    }
    objc_msgSend(v6, "dataContainerURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && objc_msgSend(v16, "length"))
    {
      objc_msgSend(v14, "addObject:", v16);
      rbs_process_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[RBProcess _allowedLockedFilePaths].cold.5();

      goto LABEL_52;
    }
    v78 = 0;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    buffer = 0u;
    v71 = 0u;
    if (proc_pidinfo(*(_DWORD *)(a1 + 8), 3, 0, &buffer, 136) != 136)
    {
      rbs_process_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v65) = v8;
        _os_log_impl(&dword_21A8B4000, v27, OS_LOG_TYPE_DEFAULT, "Could not get proc_pidinfo for pid %d to get ruid/euid", buf, 8u);
      }

      objc_msgSend(CFSTR("/var/root"), "stringByAppendingPathComponent:", CFSTR("/Library/Caches/"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "embeddedApplicationIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByAppendingPathComponent:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30 && objc_msgSend(v30, "length"))
      {
        objc_msgSend(v14, "addObject:", v30);
        rbs_process_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[RBProcess _allowedLockedFilePaths].cold.3();

      }
      objc_msgSend(CFSTR("/var/mobile"), "stringByAppendingPathComponent:", CFSTR("/Library/Caches/"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "embeddedApplicationIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringByAppendingPathComponent:", v33);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16 || !objc_msgSend(v16, "length"))
        goto LABEL_52;
      objc_msgSend(v14, "addObject:", v16);
      rbs_process_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[RBProcess _allowedLockedFilePaths].cold.3();
      goto LABEL_51;
    }
    v18 = HIDWORD(v71);
    *__error() = 0;
    v19 = getpwuid(v18);
    v54 = v14;
    v55 = v18;
    if (v19)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v19->pw_dir);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("/Library/Caches/"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "embeddedApplicationIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingPathComponent:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v23;
      if (!v23)
      {
        v14 = v54;
        goto LABEL_41;
      }
      v25 = objc_msgSend(v23, "length");
      v14 = v54;
      if (!v25)
      {
LABEL_41:
        v36 = DWORD1(v71);
        if (DWORD1(v71) == v55)
        {
          v16 = v24;
          goto LABEL_52;
        }
        v37 = v24;
        *__error() = 0;
        v38 = getpwuid(v36);
        if (v38)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v38->pw_dir);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringByAppendingPathComponent:", CFSTR("/Library/Caches/"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "embeddedApplicationIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringByAppendingPathComponent:", v41);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            v14 = v54;
            goto LABEL_52;
          }
          v14 = v54;
          if (!objc_msgSend(v16, "length"))
          {
LABEL_52:

            goto LABEL_53;
          }
          objc_msgSend(v54, "addObject:", v16);
          rbs_process_log();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            -[RBProcess _allowedLockedFilePaths].cold.1();
        }
        else
        {
          rbs_process_log();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v42 = *__error();
            *(_DWORD *)buf = 138543874;
            v65 = v7;
            v66 = 1024;
            v67 = v36;
            v68 = 1024;
            v69 = v42;
            _os_log_impl(&dword_21A8B4000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: no passwd data for euid %d (errno %d)", buf, 0x18u);
          }
          v16 = v37;
          v14 = v54;
        }
LABEL_51:

        goto LABEL_52;
      }
      objc_msgSend(v54, "addObject:", v24);
      rbs_process_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[RBProcess _allowedLockedFilePaths].cold.2();
    }
    else
    {
      rbs_process_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v35 = *__error();
        *(_DWORD *)buf = 138543874;
        v65 = v7;
        v66 = 1024;
        v67 = v18;
        v68 = 1024;
        v69 = v35;
        _os_log_impl(&dword_21A8B4000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: no passwd data for ruid %d (errno %d)", buf, 0x18u);
      }
      v24 = v16;
    }

    goto LABEL_41;
  }
  return 0;
}

- (id)_lock_lockedFilePathsIgnoring:(uint64_t)a1
{
  int v3;
  unsigned int v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  int *v9;
  unsigned int v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  const char *v16;
  uint32_t v17;
  uint64_t v18;
  int v19;
  int v20;
  size_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;
  char *v48;
  int v49;
  NSObject *v50;
  uint64_t v51;
  uint8_t *v52;
  NSObject *v53;
  os_log_type_t v54;
  const char *v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  void *v64;
  void *v65;
  id v66;
  int pid;
  NSObject *obj;
  uint64_t v69;
  id v70;
  uint64_t v71;
  char value;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  int v81;
  uint64_t v82;
  __int16 v83;
  id v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint8_t buf[48];
  stat buffer;
  __int128 v89;
  __int128 v90;
  char v91[1032];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v70 = a2;
  if (a1)
  {
    v3 = *(_DWORD *)(a1 + 8);
    v4 = proc_pidinfo(v3, 1, 0, 0, 0);
    if ((v4 & 0x80000000) == 0)
    {
      v5 = v4;
      v69 = a1;
      pid = v3;
      v64 = malloc_type_malloc(v4, 0xEE1CEF11uLL);
      v6 = proc_pidinfo(v3, 1, 0, v64, v5);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 >= 8)
      {
        v8 = v6 >> 3;
        v9 = (int *)v64;
        while (v9[1] != 1)
        {
LABEL_19:
          v9 += 2;
          if (!--v8)
            goto LABEL_20;
        }
        v90 = 0u;
        memset(v91, 0, 336);
        v89 = 0u;
        memset(&buffer, 0, sizeof(buffer));
        v10 = proc_pidfdinfo(v3, *v9, 2, &buffer, 1200);
        if (v10)
        {
          v11 = v10;
          if (v10 > 0x4AF)
          {
            v21 = strlen(v91);
            if (v21)
            {
              objc_msgSend(v65, "stringWithFileSystemRepresentation:length:", v91, v21);
              v22 = objc_claimAutoreleasedReturnValue();
              v12 = v22;
              if (v22)
              {
                -[NSObject stringByStandardizingPath](v22, "stringByStandardizingPath");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v23);

              }
              goto LABEL_18;
            }
            rbs_process_log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v24 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v24;
              v15 = v12;
              v16 = "%{public}@ nodeFDInfo.pvip.vip_path is empty for one fd";
              v17 = 12;
              goto LABEL_17;
            }
          }
          else
          {
            rbs_process_log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v13 = *(_QWORD *)(a1 + 32);
              v14 = *v9;
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v13;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v11;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = 1200;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v14;
              v15 = v12;
              v16 = "%{public}@ Weird size (%d != %lu) for fd %d";
              v17 = 34;
LABEL_17:
              _os_log_error_impl(&dword_21A8B4000, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
            }
          }
        }
        else
        {
          rbs_process_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v18 = *(_QWORD *)(a1 + 32);
            v19 = *v9;
            v20 = *__error();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v20;
            v15 = v12;
            v16 = "%{public}@ proc_pidfdinfo failed for fd %d with errno %d";
            v17 = 24;
            goto LABEL_17;
          }
        }
LABEL_18:

        goto LABEL_19;
      }
LABEL_20:
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v66 = (id)objc_claimAutoreleasedReturnValue();
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      obj = v7;
      v25 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      if (!v25)
        goto LABEL_72;
      v26 = v25;
      v71 = *(_QWORD *)v78;
LABEL_22:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v78 != v71)
          objc_enumerationMutation(obj);
        v28 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v77 + 1) + 8 * v27));
        v29 = (const char *)objc_msgSend(v28, "UTF8String");
        memset(&buffer, 0, sizeof(buffer));
        if (stat(v29, &buffer))
          break;
        if ((buffer.st_mode & 0xF000) == 0x8000)
          goto LABEL_30;
        rbs_process_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v44 = *(_QWORD *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v44;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v28;
          v39 = v37;
          v40 = "%{public}@ Not checking lock on special file: %{public}@";
          goto LABEL_49;
        }
LABEL_50:

LABEL_51:
        if (++v27 == v26)
        {
          v61 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
          v26 = v61;
          if (!v61)
          {
LABEL_72:
            v62 = obj;

            free(v64);
            goto LABEL_76;
          }
          goto LABEL_22;
        }
      }
      rbs_process_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v46 = *(_QWORD *)(v69 + 32);
        v47 = __error();
        v48 = strerror(*v47);
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2082;
        *(_QWORD *)&buf[24] = v48;
        _os_log_error_impl(&dword_21A8B4000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Could not stat %{public}@: %{public}s", buf, 0x20u);
      }

LABEL_30:
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v31 = v70;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v74;
LABEL_32:
        v35 = 0;
        while (1)
        {
          if (*(_QWORD *)v74 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v35);
          if (objc_msgSend(v28, "hasPrefix:", v36))
            break;
          if (v33 == ++v35)
          {
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
            if (v33)
              goto LABEL_32;
            goto LABEL_38;
          }
        }
        rbs_process_log();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = *(_QWORD *)(v69 + 32);
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v42;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v28;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&buf[24] = v36;
          _os_log_impl(&dword_21A8B4000, v41, OS_LOG_TYPE_INFO, "%{public}@: Ignoring file %{public}@ because it is in an allowed path:  %{public}@", buf, 0x20u);
        }

        rbs_process_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v43 = *(_QWORD *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v43;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v28;
          v39 = v37;
          v40 = "%{public}@: Ignoring file because it is in an allowed path: %{public}@";
          goto LABEL_49;
        }
        goto LABEL_50;
      }
LABEL_38:

      if ((objc_msgSend(v28, "hasSuffix:", CFSTR("-shm")) & 1) != 0
        || (objc_msgSend(v28, "hasSuffix:", CFSTR("-wal")) & 1) != 0
        || objc_msgSend(v28, "hasSuffix:", CFSTR("-journal")))
      {
        rbs_process_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = *(_QWORD *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v28;
          v39 = v37;
          v40 = "%{public}@ Ignoring SQLite journal file: %{public}@";
LABEL_49:
          _os_log_impl(&dword_21A8B4000, v39, OS_LOG_TYPE_INFO, v40, buf, 0x16u);
          goto LABEL_50;
        }
      }
      else
      {
        value = 0;
        if (getxattr(v29, "com.apple.runningboard.can-suspend-locked", 0, 0, 0, 0) == 1)
          getxattr(v29, "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
        if (value)
        {
          rbs_process_log();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            goto LABEL_50;
          v45 = *(_QWORD *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v45;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v28;
          v39 = v37;
          v40 = "%{public}@ Ignoring file with can-suspend-locked: %{public}@";
          goto LABEL_49;
        }
        v49 = _sqlite3_lockstate();
        if (v49)
        {
          if (v49 == 1)
          {
            rbs_process_log();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              v51 = *(_QWORD *)(v69 + 32);
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v51;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v28;
              v52 = buf;
              v53 = v50;
              v54 = OS_LOG_TYPE_INFO;
              v55 = "%{public}@ Found locked SQLite database: %{public}@";
              goto LABEL_62;
            }
          }
          else
          {
            *(_QWORD *)&buf[8] = 0;
            *(_DWORD *)&buf[20] = 3;
            *(_QWORD *)buf = 0;
            *(_DWORD *)&buf[16] = pid;
            v57 = open(v29, 0x20000);
            if (v57 < 1)
              goto LABEL_51;
            v58 = v57;
            v59 = fcntl(v57, 66, buf);
            close(v58);
            if (v59 == -1 || (*(_WORD *)&buf[20] & 0xFFFD) != 1)
              goto LABEL_51;
            rbs_process_log();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v60 = *(_QWORD *)(v69 + 32);
              v81 = 138543618;
              v82 = v60;
              v83 = 2114;
              v84 = v28;
              v52 = (uint8_t *)&v81;
              v53 = v50;
              v54 = OS_LOG_TYPE_DEFAULT;
              v55 = "%{public}@ Found locked file lock: %{public}@";
LABEL_62:
              _os_log_impl(&dword_21A8B4000, v53, v54, v55, v52, 0x16u);
            }
          }

          objc_msgSend(v66, "addObject:", v28);
          goto LABEL_51;
        }
        rbs_process_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v56 = *(_QWORD *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v56;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v28;
          v39 = v37;
          v40 = "%{public}@ Ignoring unlocked SQLite database: %{public}@";
          goto LABEL_49;
        }
      }
      goto LABEL_50;
    }
    rbs_process_log();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      -[RBProcess _lock_lockedFilePathsIgnoring:].cold.1();
    v66 = 0;
LABEL_76:

  }
  else
  {
    v66 = 0;
  }

  return v66;
}

void __23__RBProcess_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
  if (v1)
  {
    dispatch_source_cancel(v1);
    rbs_process_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __23__RBProcess_invalidate__block_invoke_cold_1();

  }
}

- (void)setTerminating:(BOOL)a3
{
  void *v5;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcess.m"), 543, CFSTR("Cannot set a RBProcess terminating to NO, once terminating has started it cannot be stopped"));

  }
  self->_terminating = 1;
}

void __41__RBProcess_processStateApplicationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.runningboardservices.rbprocess-state-application", v2);
  v1 = (void *)processStateApplicationQueue_queue;
  processStateApplicationQueue_queue = (uint64_t)v0;

}

+ (id)testProcessWithPid:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RBProcess *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80C98], "identityForExecutablePath:pid:auid:", CFSTR("/test"), v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80CB0], "instanceWithIdentifier:identity:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80C10], "portForSelf");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [RBProcess alloc];
  objc_msgSend(v7, "auditToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBJetsamPropertyManager testJetsamProperties](RBJetsamPropertyManager, "testJetsamProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = 0;
  v11 = -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:](v8, "_initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:", v6, v9, 0, v10, 0, 0, 0, v13);

  return v11;
}

+ (id)testProcessWithPid:(int)a3 andIdentity:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  RBProcess *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;

  v4 = *(_QWORD *)&a3;
  v5 = (void *)MEMORY[0x24BE80C90];
  v6 = a4;
  objc_msgSend(v5, "identifierWithPid:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80CB0], "instanceWithIdentifier:identity:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE80C10], "portForSelf");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [RBProcess alloc];
  objc_msgSend(v9, "auditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBJetsamPropertyManager testJetsamProperties](RBJetsamPropertyManager, "testJetsamProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = 0;
  v13 = -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:](v10, "_initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:", v8, v11, 0, v12, 0, 0, 0, v15);

  return v13;
}

+ (id)testProcessWithPid:(int)a3 identity:(id)a4 launchdProps:(id)a5 andBundleProps:(id)a6
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  RBProcess *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;

  v8 = *(_QWORD *)&a3;
  v9 = (void *)MEMORY[0x24BE80C90];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v9, "identifierWithPid:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80CB0], "instanceWithIdentifier:identity:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE80C10], "portForSelf");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [RBProcess alloc];
  objc_msgSend(v15, "auditToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBJetsamPropertyManager testJetsamProperties](RBJetsamPropertyManager, "testJetsamProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  v19 = -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:](v16, "_initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:", v14, v17, v10, v18, 0, 0, v11, v21);

  return v19;
}

+ (void)_runOnDiagnosticQueue:(uint64_t)a1
{
  void *v2;
  void *v3;
  dispatch_block_t block;

  block = a2;
  objc_opt_self();
  if (_runOnDiagnosticQueue__onceToken != -1)
    dispatch_once(&_runOnDiagnosticQueue__onceToken, &__block_literal_global_10);
  objc_msgSend(MEMORY[0x24BE80D68], "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "handoffToQueue:block:", _runOnDiagnosticQueue__diagnosticQ, block);
  else
    dispatch_async((dispatch_queue_t)_runOnDiagnosticQueue__diagnosticQ, block);

}

void __35__RBProcess__runOnDiagnosticQueue___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.runningboardservices.diagnostics", v2);
  v1 = (void *)_runOnDiagnosticQueue__diagnosticQ;
  _runOnDiagnosticQueue__diagnosticQ = (uint64_t)v0;

}

- (RBProcess)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcess.m"), 206, CFSTR("-init is not allowed on RBProcess"));

  return 0;
}

- (void)setAuditToken:(id)a3
{
  RBSAuditToken *v4;
  RBSAuditToken *v5;
  char v6;
  RBSAuditToken *auditToken;

  v4 = (RBSAuditToken *)a3;
  v5 = v4;
  if (v4)
    -[RBSAuditToken realToken](v4, "realToken");
  v6 = RBSAuditTokenRepresentsPlatformBinary();
  os_unfair_lock_lock(&self->_dataLock);
  auditToken = self->_auditToken;
  self->_auditToken = v5;

  self->_platformBinary = v6;
  os_unfair_lock_unlock(&self->_dataLock);
}

- (double)processStartTime
{
  double result;
  int *p_pid;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  double cachedProcessStartTime;
  NSObject *v12;
  int v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  _OWORD buffer[7];
  __int128 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  result = self->_cachedProcessStartTime;
  if (result == 0.0)
  {
    v21 = 0;
    v20 = 0u;
    memset(buffer, 0, sizeof(buffer));
    p_pid = &self->_pid;
    if (proc_pidinfo(self->_pid, 3, 0, buffer, 136) == 136)
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemUptime");
      v7 = v6;

      self->_cachedProcessStartTime = v7
                                    - (CFAbsoluteTimeGetCurrent()
                                     + *MEMORY[0x24BDBD238])
                                    + (double)*((unint64_t *)&v20 + 1)
                                    + (double)v21 / 1000000.0;
      RBSMachAbsoluteTime();
      v9 = v8;
      rbs_assertion_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        cachedProcessStartTime = self->_cachedProcessStartTime;
        v13 = 134218496;
        v14 = cachedProcessStartTime;
        v15 = 2048;
        v16 = v9;
        v17 = 2048;
        v18 = v9 - cachedProcessStartTime;
        _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "processStartTime calculated start is %f (now:%f, diff%f)", (uint8_t *)&v13, 0x20u);
      }

      return self->_cachedProcessStartTime;
    }
    else
    {
      rbs_assertion_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[RBProcess processStartTime].cold.1(p_pid, v12);

      self->_cachedProcessStartTime = 0.0001;
      return 0.0001;
    }
  }
  return result;
}

- (void)setProcessStartTime:(double)a3
{
  self->_cachedProcessStartTime = a3;
}

- (BOOL)isJetsamManaged
{
  return (self->_manageFlags >> 3) & 1;
}

- (BOOL)isBeingPtraced
{
  return RBSPIDIsBeingDebugged();
}

- (BOOL)isContainerized
{
  RBSAuditToken *auditToken;
  int v4;
  RBSAuditToken *v5;

  auditToken = self->_auditToken;
  if (auditToken)
    -[RBSAuditToken realToken](auditToken, "realToken");
  v4 = sandbox_check_by_audit_token();
  if (v4)
  {
    v5 = self->_auditToken;
    if (v5)
      -[RBSAuditToken realToken](v5, "realToken");
    LOBYTE(v4) = sandbox_container_path_for_audit_token() == 0;
  }
  return v4;
}

- (void)_systemPreventIdleSleepStateDidChange:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_systemPreventsIdleSleep = a3;
  if (!self->_terminating && !a3 && self->_suspended && -[RBProcess isLifecycleManaged](self, "isLifecycleManaged"))
    -[RBProcess _lock_shutdownSocketsAndLog:]((uint64_t)self, 0);
  os_unfair_lock_unlock(p_lock);
}

- (void)_applyJetsamLenientModeState:(uint64_t)a1
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 109) & 8) == 0)
    {
      rbs_process_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v4;
        v5 = "%{public}@ Ignoring jetsam lenient mode because this process is not memory-managed";
LABEL_5:
        v6 = v3;
        v7 = OS_LOG_TYPE_DEFAULT;
        v8 = 12;
LABEL_18:
        _os_log_impl(&dword_21A8B4000, v6, v7, v5, (uint8_t *)&v15, v8);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_applyJetsamLenientModeState__lock);
    v10 = _applyJetsamLenientModeState__count;
    if (!a2)
    {
      --_applyJetsamLenientModeState__count;
      os_unfair_lock_unlock((os_unfair_lock_t)&_applyJetsamLenientModeState__lock);
      if (v10 == 1)
      {
        if (memorystatus_control())
        {
          if (*__error() == 3)
            return;
          rbs_process_log();
          v3 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
            -[RBProcess _applyJetsamLenientModeState:].cold.2();
          goto LABEL_19;
        }
        rbs_process_log();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 32);
          v15 = 138543362;
          v16 = v13;
          v5 = "%{public}@ Disabled jetsam lenient mode";
          goto LABEL_5;
        }
LABEL_19:

        return;
      }
      rbs_process_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      v12 = *(_QWORD *)(a1 + 32);
      v15 = 138543618;
      v16 = v12;
      v17 = 2048;
      v18 = _applyJetsamLenientModeState__count;
      v5 = "%{public}@ Tried to disable jetsam lenient mode but it is still in use (count %lu)";
LABEL_17:
      v6 = v3;
      v7 = OS_LOG_TYPE_INFO;
      v8 = 22;
      goto LABEL_18;
    }
    ++_applyJetsamLenientModeState__count;
    os_unfair_lock_unlock((os_unfair_lock_t)&_applyJetsamLenientModeState__lock);
    if (v10)
    {
      rbs_process_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      v11 = *(_QWORD *)(a1 + 32);
      v15 = 138543618;
      v16 = v11;
      v17 = 2048;
      v18 = _applyJetsamLenientModeState__count;
      v5 = "%{public}@ Tried to enable jetsam lenient mode but it is already enabled (count %lu)";
      goto LABEL_17;
    }
    if (!memorystatus_control())
    {
      rbs_process_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 138543362;
      v16 = v14;
      v5 = "%{public}@ Enabled jetsam lenient mode";
      goto LABEL_5;
    }
    if (*__error() != 3)
    {
      rbs_process_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[RBProcess _applyJetsamLenientModeState:].cold.1();
      goto LABEL_19;
    }
  }
}

- (void)collectDiagnostic:(unint64_t)a3 description:(id)a4 domain:(unsigned int)a5 code:(unint64_t)a6 additionalPayload:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  _BOOL4 diagnosticsStarted;
  uint64_t v18;
  void *v19;
  id v20;
  dispatch_time_t v21;
  NSObject *v22;
  id v23;
  _QWORD block[4];
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  unsigned int v32;
  _QWORD v33[5];
  id v34;

  v14 = a4;
  v15 = a7;
  v16 = a8;
  os_unfair_lock_lock(&self->_lock);
  self->_terminating = 1;
  diagnosticsStarted = self->_diagnosticsStarted;
  self->_diagnosticsStarted = 1;
  os_unfair_lock_unlock(&self->_lock);
  if (diagnosticsStarted)
  {
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }
  else
  {
    v18 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke;
    v33[3] = &unk_24DD467F0;
    v33[4] = self;
    v34 = v16;
    v19 = (void *)MEMORY[0x22074BF04](v33);
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_2;
    v26[3] = &unk_24DD46818;
    v30 = a3;
    v26[4] = self;
    v32 = a5;
    v27 = v14;
    v31 = a6;
    v28 = v15;
    v20 = v19;
    v29 = v20;
    +[RBProcess _runOnDiagnosticQueue:]((uint64_t)RBProcess, v26);
    v21 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(25, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_44;
    block[3] = &unk_24DD46458;
    v25 = v20;
    v23 = v20;
    dispatch_after(v21, v22, block);

  }
}

void __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 80);
  *(_BYTE *)(v2 + 80) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  if (!v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 == 3)
  {
    rbs_process_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_21A8B4000, v3, OS_LOG_TYPE_INFO, "%{public}@ Taking tailspin...", (uint8_t *)&v10, 0xCu);
    }

    v5 = -[RBProcess _generateTailspin](*(_QWORD *)(a1 + 32));
    rbs_process_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_INFO, "%{public}@ Tailspin complete", (uint8_t *)&v10, 0xCu);
      }

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_2_cold_1();

    }
  }
  else if (v2 == 2)
  {
    -[RBProcess _generateStackshotWithDescription:domain:code:additionalPayload:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40), *(_DWORD *)(a1 + 80), *(_QWORD *)(a1 + 72), *(void **)(a1 + 48));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (uint64_t)_generateStackshotWithDescription:(int)a3 domain:(uint64_t)a4 code:(void *)a5 additionalPayload:
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a5;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_13;
  }
  rbs_process_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = a1[4];
    *(_DWORD *)buf = 138543362;
    v21 = v12;
    _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_INFO, "%{public}@ Taking stackshot...", buf, 0xCu);
  }

  v22 = 0;
  *(_DWORD *)buf = a3;
  v21 = a4;
  objc_msgSend(a1, "_sendSignal:", 17);
  if (v10)
  {
    if ((WriteCrashReportWithStackshotWithPayload() & 1) != 0)
      goto LABEL_6;
LABEL_9:
    rbs_process_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = a1[4];
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Stackshot generation skipped", (uint8_t *)&v18, 0xCu);
    }
    v14 = 0;
    goto LABEL_12;
  }
  if (!WriteCrashReportWithStackshot())
    goto LABEL_9;
LABEL_6:
  rbs_process_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = 1;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = a1[4];
    v18 = 138543362;
    v19 = v15;
    _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_INFO, "%{public}@ Stackshot complete", (uint8_t *)&v18, 0xCu);
  }
LABEL_12:

LABEL_13:
  return v14;
}

- (uint64_t)_generateTailspin
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  id v34;

  v1 = 0;
  if (a1 && MEMORY[0x24BEDE460])
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/tmp/com.apple.runningboardd/"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      rbs_general_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[RBProcess _generateTailspin].cold.4((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

      v34 = 0;
      objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v34);
      v5 = v34;
    }
    if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) == 0)
    {
      rbs_general_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[RBProcess _generateTailspin].cold.3((uint64_t)v5, v13, v25, v26, v27, v28, v29, v30);
      v1 = 0;
      goto LABEL_23;
    }
    v13 = objc_alloc_init(MEMORY[0x24BDD1500]);
    -[NSObject setDateFormat:](v13, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject stringFromDate:](v13, "stringFromDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("ts-%@-%@.tailspin"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByAppendingPathComponent:", v18);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend(v19, "cStringUsingEncoding:", 1);

    v21 = open(v20, 514, 420);
    if (v21 == -1)
    {
      rbs_process_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[RBProcess _generateTailspin].cold.1();

    }
    else
    {
      v22 = v21;
      v23 = tailspin_config_create_with_default_config();
      if (v23)
      {
        v24 = v23;
        v1 = 1;
        tailspin_enabled_set();
        tailspin_dump_output_sync();
        MEMORY[0x22074C330](v24);
        close(v22);
LABEL_22:

LABEL_23:
        return v1;
      }
      rbs_process_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[RBProcess _generateTailspin].cold.2();

      close(v22);
    }
    v1 = 0;
    goto LABEL_22;
  }
  return v1;
}

uint64_t __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)terminateWithContext:(id)a3
{
  RBProcess *v3;
  os_unfair_lock_s *p_lock;
  id v5;

  v3 = self;
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = -[RBProcess _lock_terminateWithContext:]((uint64_t)v3, v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (uint64_t)_lock_terminateWithContext:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  uint64_t v13;
  unsigned __int8 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    rbs_process_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      v18 = 2114;
      v19 = v3;
      _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Terminating with context: %{public}@", buf, 0x16u);
    }

    *(_BYTE *)(a1 + 128) = 1;
    if (!v3)
    {
      v3 = objc_alloc_init(MEMORY[0x24BE80D40]);
      objc_msgSend(v3, "setReportType:", 0);
      objc_msgSend(v3, "setMaximumTerminationResistance:", 40);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    v6 = objc_msgSend(*(id *)(a1 + 152), "copyWithTerminationContext:", v3);
    v7 = *(void **)(a1 + 152);
    *(_QWORD *)(a1 + 152) = v6;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
    objc_msgSend(v3, "reportType");
    objc_msgSend(v3, "exceptionDomain");
    objc_msgSend(v3, "exceptionCode");
    objc_msgSend(v3, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "UTF8String");
    v9 = terminate_with_reason();

    rbs_process_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[RBProcess _lock_terminateWithContext:].cold.1();

      v12 = objc_msgSend((id)a1, "_sendSignal:", 9);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v17 = v13;
        _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate_with_reason() success", buf, 0xCu);
      }

      v12 = 1;
    }
    v15 = v12;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_sendSignal:(int)a3
{
  NSObject *v5;
  NSString *shortDescription;
  NSObject *v8;
  int v9;
  NSString *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  rbs_process_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    shortDescription = self->_shortDescription;
    v9 = 138543618;
    v10 = shortDescription;
    v11 = 1024;
    v12 = a3;
    _os_log_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending kill(%d)", (uint8_t *)&v9, 0x12u);
  }

  if (!kill(self->_pid, a3) || *__error() == 3)
    return 1;
  rbs_process_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[RBProcess _sendSignal:].cold.1();

  return 0;
}

- (void)_lock_applyCarPlayMode
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_22();
  v0 = __error();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_20(&dword_21A8B4000, v1, v2, "%{public}@ Error %d setting Carplay mode to %{public}d: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_4();
}

- (void)_lock_setCPULimits:(uint64_t)a1 violationPolicy:(int *)a2
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *__error() = 0;
    if (objc_msgSend(*(id *)(a1 + 64), "effectiveMaxCPUUsageViolationPolicy") == 2)
    {
      if (proc_set_cpumon_params_fatal())
      {
LABEL_4:
        if (*__error() == 3)
          return;
        rbs_process_log();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          -[RBProcess _lock_setCPULimits:violationPolicy:].cold.1();
        goto LABEL_10;
      }
    }
    else if (proc_set_cpumon_params())
    {
      goto LABEL_4;
    }
    rbs_process_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *a2;
      v7 = a2[1];
      v8 = 138543874;
      v9 = v5;
      v10 = 1024;
      v11 = v6;
      v12 = 1024;
      v13 = v7;
      _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_INFO, "%{public}@ Enabled CPU monitoring %d%%/%ds", (uint8_t *)&v8, 0x18u);
    }
LABEL_10:

  }
}

void __36__RBProcess__allowedLockedFilePaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("CFFIXED_USER_HOME")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("HOME")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("TMPDIR")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

- (void)invokeHandlerOnProcessDeath:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uintptr_t pid;
  NSObject *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *procSource;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD handler[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (self->_procSource)
    -[RBProcess invokeHandlerOnProcessDeath:onQueue:].cold.1();
  v8 = v7;
  pid = self->_pid;
  v10 = objc_msgSend(MEMORY[0x24BE80D58], "sharedBackgroundWorkloop");
  v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDAC9F8], pid, 0xA0000000uLL, v10);
  procSource = self->_procSource;
  self->_procSource = v11;

  dispatch_set_qos_class_fallback();
  v13 = self->_procSource;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __49__RBProcess_invokeHandlerOnProcessDeath_onQueue___block_invoke;
  handler[3] = &unk_24DD46480;
  handler[4] = self;
  v17 = v8;
  v18 = v6;
  v14 = v6;
  v15 = v8;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_activate((dispatch_object_t)self->_procSource);

}

void __49__RBProcess_invokeHandlerOnProcessDeath_onQueue___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD activity_block[5];
  id v4;
  id v5;

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__RBProcess_invokeHandlerOnProcessDeath_onQueue___block_invoke_2;
  activity_block[3] = &unk_24DD46480;
  v2 = *(void **)(a1 + 40);
  activity_block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  _os_activity_initiate(&dword_21A8B4000, "Process Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __49__RBProcess_invokeHandlerOnProcessDeath_onQueue___block_invoke_2(uint64_t a1)
{
  int data;
  double v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  dispatch_time_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  data = dispatch_source_get_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 112));
  if ((data & 0x20000000) != 0)
  {
    RBSMachAbsoluteTime();
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "processStartTime");
    v6 = v5;
    rbs_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v14 = 138543618;
      v15 = v13;
      v16 = 2048;
      v17 = v4 - v6;
      _os_log_error_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_ERROR, "NOTE: unexpected exec event for %{public}@ after %f seconds - hoping it is a delayed xpcproxy exec notification", (uint8_t *)&v14, 0x16u);
    }

  }
  if (data < 0)
  {
    rbs_process_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ termination reported by proc_exit", (uint8_t *)&v14, 0xCu);
    }

    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 112));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 112);
    *(_QWORD *)(v10 + 112) = 0;

    v12 = dispatch_time(0, 100000000);
    dispatch_after(v12, *(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
  }
}

- (BOOL)matchesProcess:(id)a3
{
  return -[RBSProcessHandle matchesProcess:](self->_handle, "matchesProcess:", a3);
}

- (id)processPredicate
{
  return (id)objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingIdentifier:", self->_instance);
}

- (id)createRBSTarget
{
  return (id)objc_msgSend(MEMORY[0x24BE80D38], "targetWithPid:", -[RBProcess rbs_pid](self, "rbs_pid"));
}

- (RBSProcessExitStatus)intendedExitStatus
{
  return self->_intendedExitStatus;
}

- (void)setIntendedExitStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int)pidversion
{
  return self->_pidversion;
}

- (NSString)homeDirectory
{
  return self->_homeDirectory;
}

- (NSString)tmpDirectory
{
  return self->_tmpDirectory;
}

- (unint64_t)resourceCoalitionID
{
  return self->_resourceCoalitionID;
}

- (void)setResourceCoalitionID:(unint64_t)a3
{
  self->_resourceCoalitionID = a3;
}

- (unint64_t)jetsamCoalitionID
{
  return self->_jetsamCoalitionID;
}

- (void)setJetsamCoalitionID:(unint64_t)a3
{
  self->_jetsamCoalitionID = a3;
}

- (BOOL)isJetsamCoalitionLeader
{
  return self->_jetsamCoalitionLeader;
}

- (void)setJetsamCoalitionLeader:(BOOL)a3
{
  self->_jetsamCoalitionLeader = a3;
}

- (void)_memoryStatusControl:flags:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_0_7(&dword_21A8B4000, v1, v2, "%{public}@ Memorystatus failed with unexpected error: %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_4();
}

- (void)_initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:.cold.1()
{
  __assert_rtn("-[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:]", "RBProcess.m", 254, "[[instance identity] osServiceType] != RBSOSServiceProcessIdentityTypeUnknown");
}

- (void)_initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:cache:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "could not find extension point for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)memoryLimits
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_FAULT, "Memory Limits for process:%{public}@ unknown", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)processStartTime
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Could not get proc_pidinfo for pid %d, using defaults", (uint8_t *)v3, 8u);
}

- (void)_lock_shutdownSocketsAndLog:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = OUTLINED_FUNCTION_13_0();
  v5 = 138543618;
  v6 = v2;
  v7 = 2080;
  v8 = OUTLINED_FUNCTION_7(v4);
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "%{public}@ pid_shutdown_sockets() failed with error: %s", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_applyJetsamLenientModeState:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12_0();
  v0 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(&dword_21A8B4000, v1, v2, "%{public}@ Error %d enabling jetsam lenient mode: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_4();
}

- (void)_applyJetsamLenientModeState:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12_0();
  v0 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(&dword_21A8B4000, v1, v2, "%{public}@ Error %d disabling jetsam lenient mode: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_4();
}

void __23__RBProcess_invalidate__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_18(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "RBProcess %{public}@ invalidated before invokeHandlerOnProcessDeath handler was invoked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __84__RBProcess_collectDiagnostic_description_domain_code_additionalPayload_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_18(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "%{public}@ Tailspin generation failed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_generateTailspin
{
  OUTLINED_FUNCTION_3(&dword_21A8B4000, a2, a3, "Directory does not exist: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_lock_terminateWithContext:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_10_0(&dword_21A8B4000, v0, (uint64_t)v0, "%{public}@ terminate_with_reason() failed with error: %d", v1);
  OUTLINED_FUNCTION_1_1();
}

- (void)_sendSignal:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = __error();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_20(&dword_21A8B4000, v1, v2, "%{public}@ kill(%d) failed. Error: %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_4();
}

void __26__RBProcess__lock_suspend__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_18(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ locked files not in allowed directories: %{public}@");
  OUTLINED_FUNCTION_1_1();
}

void __26__RBProcess__lock_suspend__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_18(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "%{public}@ suspended with locked system files:\n%{public}@\n");
  OUTLINED_FUNCTION_1_1();
}

- (void)_allowedLockedFilePaths
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_21A8B4000, v0, v1, "%{public}@: home directory '%{public}@' allowed");
  OUTLINED_FUNCTION_1_1();
}

- (void)_lock_lockedFilePathsIgnoring:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12_0();
  v0 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(&dword_21A8B4000, v1, v2, "%{public}@ Could not get file descriptor count: %d/%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_4();
}

- (void)_lock_setCPULimits:violationPolicy:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9(&dword_21A8B4000, v0, v1, "%{public}@ Error enabling CPU monitoring: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)invokeHandlerOnProcessDeath:onQueue:.cold.1()
{
  __assert_rtn("-[RBProcess invokeHandlerOnProcessDeath:onQueue:]", "RBProcess.m", 1750, "_procSource == nil");
}

@end
