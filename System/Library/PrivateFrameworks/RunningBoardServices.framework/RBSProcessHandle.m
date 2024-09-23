@implementation RBSProcessHandle

- (BOOL)isReported
{
  return self->_data >> 63;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessHandle *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (RBSProcessHandle *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && -[RBSProcessHandle matchesProcess:](self, "matchesProcess:", v4);
  }

  return v6;
}

- (BOOL)matchesProcess:(id)a3
{
  RBSProcessHandle *v4;
  RBSProcessHandle *v5;
  int pid;
  char v7;
  RBSProcessIdentity *identity;
  void *v9;

  v4 = (RBSProcessHandle *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (-[RBSProcessHandle rbs_pid](v4, "rbs_pid") == -1)
  {
    identity = self->_identity;
    -[RBSProcessHandle identity](v5, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[RBSProcessIdentity isEqual:](identity, "isEqual:", v9);

  }
  else
  {
    pid = self->_pid;
    v7 = pid == -[RBSProcessHandle rbs_pid](v5, "rbs_pid");
  }

  return v7;
}

- (int)pid
{
  return self->_pid;
}

- (RBSProcessBundle)bundle
{
  return self->_bundle;
}

- (RBSProcessInstance)instance
{
  void *v2;
  void *v4;

  if ((self->_data & 0x4000000000000000) != 0)
  {
    +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", self->_pid);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessInstance instanceWithIdentifier:identity:](RBSProcessInstance, "instanceWithIdentifier:identity:", v4, self->_identity);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return (RBSProcessInstance *)v2;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessHandle)initWithRBSXPCCoder:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  RBSProcessHandle *v15;
  void *v16;
  uint64_t v17;
  RBSProcessHandle *v18;
  uint64_t v19;
  RBSProcessIdentity *identity;
  uint64_t v21;
  BSAuditToken *bsAuditToken;
  uint64_t v23;
  RBSProcessBundle *bundle;
  RBSProcessBundle *v25;
  void *v26;
  void *v27;
  void *v29;
  objc_super v30;

  v5 = a3;
  v6 = objc_msgSend(v5, "decodeUInt64ForKey:", CFSTR("&"));
  if (v6)
  {
    v7 = v6;
    rbs_process_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[RBSProcessHandle initWithRBSXPCCoder:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    +[RBSProcessHandle handleForKey:fetchIfNeeded:](RBSProcessHandle, "handleForKey:fetchIfNeeded:", v7, 1);
    v15 = (RBSProcessHandle *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("_codedHandle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      +[RBSXPCCoder coderWithMessage:](RBSXPCCoder, "coderWithMessage:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v17;
    }
    v30.receiver = self;
    v30.super_class = (Class)RBSProcessHandle;
    v18 = -[RBSProcessHandle init](&v30, sel_init);
    if (v18)
    {
      v18->_data = objc_msgSend(v5, "decodeUInt64ForKey:", CFSTR("_data"));
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identity"));
      v19 = objc_claimAutoreleasedReturnValue();
      identity = v18->_identity;
      v18->_identity = (RBSProcessIdentity *)v19;

      if (!v18->_identity)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("RBSProcessHandle.m"), 698, CFSTR("Expect nonnil identity"));

      }
      v18->_pid = objc_msgSend(v5, "decodeUInt64ForKey:", CFSTR("_pid"));
      if (objc_opt_class())
      {
        objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bsAuditToken"));
        v21 = objc_claimAutoreleasedReturnValue();
        bsAuditToken = v18->_bsAuditToken;
        v18->_bsAuditToken = (BSAuditToken *)v21;

      }
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundle"));
      v23 = objc_claimAutoreleasedReturnValue();
      bundle = v18->_bundle;
      v18->_bundle = (RBSProcessBundle *)v23;

      if ((v18->_data & 0x4000000000000000) != 0)
      {
        v25 = v18->_bundle;
        +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", v18->_pid);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[RBSProcessInstance instanceWithIdentifier:identity:](RBSProcessInstance, "instanceWithIdentifier:identity:", v26, v18->_identity);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBSProcessBundle setInstance:](v25, "setInstance:", v27);

      }
    }
    self = v18;

    v15 = self;
  }

  return v15;
}

+ (id)handleForKey:(unint64_t)a3 fetchIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  unint64_t v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessHandle _cachedHandleForKey:]((uint64_t)RBSProcessHandle, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleForKey:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    rbs_process_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218242;
      v20 = a3;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_190CD6000, v11, OS_LOG_TYPE_DEFAULT, "Hit the server for a process handle %llx that resolved to: %{public}@", (uint8_t *)&v19, 0x16u);
    }

    if (v10)
    {
      +[RBSProcessHandle _cacheHandle:]((uint64_t)RBSProcessHandle, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      rbs_process_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[RBSProcessHandle handleForKey:fetchIfNeeded:].cold.1(a3, v10, v12, v13, v14, v15, v16, v17);
      v7 = 0;
    }

  }
  return v7;
}

+ (id)_cachedHandleForKey:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
  objc_msgSend((id)__ProcessHandles, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
  -[RBSProcessHandle _keepAlive](v3);
  return v3;
}

- (void)_keepAlive
{
  id v1;
  dispatch_time_t v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  if (a1)
  {
    v1 = a1;
    v2 = dispatch_time(0, 1000000000);
    v3 = +[RBSWorkloop sharedBackgroundWorkloop](RBSWorkloop, "sharedBackgroundWorkloop");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__RBSProcessHandle__keepAlive__block_invoke;
    block[3] = &unk_1E2D17490;
    v6 = v1;
    v4 = v1;
    dispatch_after(v2, v3, block);

  }
}

- (void)dealloc
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  objc_super v7;
  _QWORD block[4];
  id v9;
  id v10;

  v3 = self->_data & 0x1FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (self->_pid < 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  if (v4 | v5)
  {
    v6 = +[RBSWorkloop sharedBackgroundWorkloop](RBSWorkloop, "sharedBackgroundWorkloop");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__RBSProcessHandle_dealloc__block_invoke;
    block[3] = &unk_1E2D17468;
    v9 = (id)v4;
    v10 = (id)v5;
    dispatch_async(v6, block);

  }
  v7.receiver = self;
  v7.super_class = (Class)RBSProcessHandle;
  -[RBSProcessHandle dealloc](&v7, sel_dealloc);
}

- (BOOL)isLifecycleManaged
{
  return (HIBYTE(self->_data) >> 5) & 1;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if ((self->_data & 0x4000000000000000) != 0)
  {
    -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@:%d]"), v5, self->_pid);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithFormat:", CFSTR("<inert:[%@:%d]*>"), v5, 0xFFFFFFFFLL);
  }
  v7 = (void *)v6;

  return (NSString *)v7;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t *p_data;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RBSProcessHandleFullEncode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && (self->_data & 0x4000000000000000) != 0)
  {
    p_data = &self->_data;
    rbs_process_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[RBSProcessHandle encodeWithRBSXPCCoder:].cold.1((uint64_t)p_data, v9, v10, v11, v12, v13, v14, v15);

    objc_msgSend(v4, "encodeUInt64:forKey:", *p_data & 0x1FFFFFFFFFFFFFFFLL, CFSTR("&"));
  }
  else
  {
    -[RBSProcessHandle _fullEncode:]((uint64_t)self, v4);
  }

}

- (BOOL)isDaemon
{
  return -[RBSProcessIdentity osServiceType](self->_identity, "osServiceType") == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_cachedName, 0);
  objc_storeStrong((id *)&self->_bsAuditToken, 0);
  objc_storeStrong((id *)&self->_codedHandle, 0);
  objc_storeStrong((id *)&self->_legacyHandle, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_taskPort, 0);
}

- (BOOL)isApplication
{
  return -[RBSProcessIdentity isApplication](self->_identity, "isApplication");
}

+ (id)currentProcess
{
  void *v2;
  void *v3;

  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection handle]((uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (RBSProcessState)currentState
{
  void *v2;
  void *v4;

  if ((self->_data & 0x4000000000000000) != 0)
  {
    +[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValues:", -1);
    -[RBSProcessHandle currentStateMatchingDescriptor:](self, "currentStateMatchingDescriptor:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return (RBSProcessState *)v2;
}

- (id)currentStateMatchingDescriptor:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if ((self->_data & 0x4000000000000000) != 0)
  {
    v5 = a3;
    +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessHandle processPredicate](self, "processPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statesForPredicate:withDescriptor:error:", v7, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingHandle:](RBSProcessPredicate, "predicateMatchingHandle:", self);
}

+ (id)observeForImminentAssertionsExpiration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSProcessHandle.m"), 558, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection observeProcessAssertionsExpirationWarningWithBlock:]((uint64_t)v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)monitorForDeath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  RBSProcessHandle *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((self->_data & 0x4000000000000000) != 0)
  {
    rbs_process_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_190CD6000, v5, OS_LOG_TYPE_DEFAULT, "Starting death monitoring for handle %@", buf, 0xCu);
    }

    +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", self->_pid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__RBSProcessHandle_monitorForDeath___block_invoke;
    v8[3] = &unk_1E2D17A28;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v6, "subscribeToProcessDeath:handler:", v7, v8);

  }
}

+ (id)handleForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "rbs_pid");
  if ((int)v7 <= 0)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D68];
      v17[0] = CFSTR("Invalid process identifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("RBSRequestErrorDomain"), 1, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = 0;
  }
  else
  {
    v8 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v6;
LABEL_9:
      v12 = v9;
      goto LABEL_10;
    }
    if ((_DWORD)v8 == getpid())
    {
      objc_msgSend(a1, "currentProcess");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessHandle _cachedHandleForKey:]((uint64_t)RBSProcessHandle, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      +[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "handleForPredicate:error:", v15, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_10:

  return v12;
}

+ (id)handleForPredicate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleForPredicate:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[RBSProcessHandle _cacheHandle:]((uint64_t)RBSProcessHandle, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (_QWORD)_cacheHandle:(uint64_t)a1
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v2 = a2;
  objc_opt_self();
  v3 = v2[6] & 0x1FFFFFFFFFFFFFFFLL;
  v4 = objc_msgSend(v2, "pid");
  if (v3)
    v5 = (int)v4 <= 0;
  else
    v5 = 1;
  if (v5)
  {
    rbs_process_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[RBSProcessHandle _cacheHandle:].cold.1((uint64_t)v2, v6, v7, v8, v9, v10, v11, v12);

    v13 = v2;
  }
  else
  {
    v14 = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
    if (!__ProcessHandles)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)__ProcessHandles;
      __ProcessHandles = v15;

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__ProcessHandles, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend((id)__ProcessHandles, "objectForKey:", v17);
      v19 = v2;
      v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)__ProcessHandles, "setObject:forKey:", v2, v17);
      v20 = (void *)__ProcessHandles;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v2, v19);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
    -[RBSProcessHandle _keepAlive](v2);
    v13 = v2;

  }
  return v13;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_bsAuditToken;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 realToken](result, "realToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (RBSProcessHandle)initWithIdentity:(id)a3
{
  return (RBSProcessHandle *)-[RBSProcessHandle _initWithIdentity:beforeTranslocationBundlePath:executablePath:](self, a3, 0, 0);
}

- (RBSProcessHandle)initWithInstance:(id)a3 auditToken:(id)a4 bundleData:(id)a5 manageFlags:(unsigned __int8)a6 beforeTranslocationBundlePath:(id)a7 executablePath:(id)a8 cache:(BOOL)a9
{
  int v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  RBSProcessHandle *v21;
  uint32_t v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  RBSProcessIdentity *identity;
  void *v27;
  uint64_t v28;
  BSAuditToken *bsAuditToken;
  uint64_t v30;
  RBSProcessBundle *bundle;
  id v32;
  RBSXPCCoder *v33;
  uint64_t v34;
  OS_xpc_object *codedHandle;
  void *v37;
  void *v38;
  _OWORD v39[2];
  audit_token_t atoken;
  objc_super v41;

  v11 = a6;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessHandle.m"), 281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instance"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessHandle.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auditToken"));

LABEL_3:
  v41.receiver = self;
  v41.super_class = (Class)RBSProcessHandle;
  v21 = -[RBSProcessHandle init](&v41, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v16, "rbs_pid");
    v23 = arc4random();
    if (v23 <= v22)
      v24 = v22;
    else
      v24 = v23;
    v21->_data = ((unint64_t)(v11 != 0) << 63) | ((unint64_t)(v11 & 1) << 61) | ((int)v22 | (unint64_t)(v24 << 32)) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
    objc_msgSend(v16, "identity");
    v25 = objc_claimAutoreleasedReturnValue();
    identity = v21->_identity;
    v21->_identity = (RBSProcessIdentity *)v25;

    v21->_pid = objc_msgSend(v16, "rbs_pid");
    if (v17)
      objc_msgSend(v17, "realToken");
    else
      memset(&atoken, 0, sizeof(atoken));
    v21->_euid = audit_token_to_euid(&atoken);
    if (objc_opt_class())
    {
      v27 = (void *)MEMORY[0x1E0D016D8];
      if (v17)
        objc_msgSend(v17, "realToken");
      else
        memset(v39, 0, sizeof(v39));
      objc_msgSend(v27, "tokenFromAuditToken:", v39);
      v28 = objc_claimAutoreleasedReturnValue();
      bsAuditToken = v21->_bsAuditToken;
      v21->_bsAuditToken = (BSAuditToken *)v28;

    }
    +[RBSProcessBundle bundleWithDataSource:](RBSProcessBundle, "bundleWithDataSource:", v18);
    v30 = objc_claimAutoreleasedReturnValue();
    bundle = v21->_bundle;
    v21->_bundle = (RBSProcessBundle *)v30;

    if (a9)
      v32 = +[RBSProcessHandle _cacheHandle:]((uint64_t)RBSProcessHandle, v21);
    v33 = objc_alloc_init(RBSXPCCoder);
    -[RBSProcessHandle _fullEncode:]((uint64_t)v21, v33);
    -[RBSXPCCoder createMessage](v33, "createMessage");
    v34 = objc_claimAutoreleasedReturnValue();
    codedHandle = v21->_codedHandle;
    v21->_codedHandle = (OS_xpc_object *)v34;

  }
  return v21;
}

- (void)_fullEncode:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v3, "encodeObject:forKey:", v5, CFSTR("_codedHandle"));
    }
    else
    {
      rbs_general_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 48);
        v8 = *(_DWORD *)(a1 + 64);
        v10 = 138412802;
        v11 = a1;
        v12 = 2048;
        v13 = v7;
        v14 = 1024;
        v15 = v8;
        _os_log_impl(&dword_190CD6000, v6, OS_LOG_TYPE_DEFAULT, "Full encoding handle %@, with data %llx, and pid %d", (uint8_t *)&v10, 0x1Cu);
      }

      objc_msgSend(v4, "encodeObject:forKey:", *(_QWORD *)(a1 + 72), CFSTR("_identity"));
      objc_msgSend(v4, "encodeUInt64:forKey:", *(int *)(a1 + 64), CFSTR("_pid"));
      if (objc_opt_class())
        objc_msgSend(v4, "encodeObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("_bsAuditToken"));
      objc_msgSend(v4, "encodeObject:forKey:", *(_QWORD *)(a1 + 80), CFSTR("_bundle"));
      v9 = *(_QWORD *)(a1 + 48);
      if (v9)
        objc_msgSend(v4, "encodeUInt64:forKey:", v9, CFSTR("_data"));
    }
  }

}

- (NSString)executablePath
{
  return 0;
}

- (NSString)consistentJobLabel
{
  return -[RBSProcessIdentity consistentLaunchdJobLabel](self->_identity, "consistentLaunchdJobLabel");
}

void __27__RBSProcessHandle_dealloc__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
  if (*(_QWORD *)(a1 + 32))
    v2 = (id)objc_msgSend((id)__ProcessHandles, "objectForKey:");
  if (*(_QWORD *)(a1 + 40))
    v3 = (id)objc_msgSend((id)__ProcessHandles, "objectForKey:");
  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
}

- (void)fullEncode:(id)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB3978];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentThread");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "threadDictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("RBSProcessHandleFullEncode"));
  objc_msgSend(v8, "encodeObject:forKey:", self, v7);

  objc_msgSend(v10, "removeObjectForKey:", CFSTR("RBSProcessHandleFullEncode"));
}

- (BOOL)isXPCService
{
  return -[RBSProcessIdentity isXPCService](self->_identity, "isXPCService");
}

- (BOOL)hasConsistentLaunchdJob
{
  return -[RBSProcessIdentity hasConsistentLaunchdJob](self->_identity, "hasConsistentLaunchdJob");
}

- (double)elapsedCPUTimeForFrontBoard
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  RBSMachPortTaskNameRight *taskPort;
  RBSMachPortTaskNameRight *v12;
  RBSMachPortTaskNameRight *v13;
  void *v14;
  void *v15;
  RBSMachPortTaskNameRight *v16;
  RBSMachPortTaskNameRight *v17;
  task_name_t v18;
  task_name_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  mach_msg_type_number_t v47;
  integer_t v48[2];
  uint64_t v49;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v52;
  uint64_t v53;

  if ((self->_data & 0x4000000000000000) == 0)
  {
    rbs_process_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[RBSProcessHandle elapsedCPUTimeForFrontBoard].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
LABEL_15:

    return 0.0;
  }
  taskPort = self->_taskPort;
  if (!taskPort)
  {
    +[RBSMachPortTaskNameRight taskNameForPID:](RBSMachPortTaskNameRight, "taskNameForPID:", self->_pid);
    v12 = (RBSMachPortTaskNameRight *)objc_claimAutoreleasedReturnValue();
    v13 = self->_taskPort;
    self->_taskPort = v12;

    taskPort = self->_taskPort;
    if (!taskPort)
    {
      +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", self->_pid);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "portForIdentifier:", v15);
      v16 = (RBSMachPortTaskNameRight *)objc_claimAutoreleasedReturnValue();
      v17 = self->_taskPort;
      self->_taskPort = v16;

      taskPort = self->_taskPort;
    }
  }
  v18 = -[RBSMachPortTaskNameRight port](taskPort, "port");
  if (v18 - 1 > 0xFFFFFFFD)
  {
    rbs_process_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[RBSProcessHandle elapsedCPUTimeForFrontBoard].cold.4(v2, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_15;
  }
  v19 = v18;
  v53 = 0;
  *(_OWORD *)task_info_out = 0u;
  v52 = 0u;
  task_info_outCnt = 10;
  v20 = task_info(v18, 0x12u, task_info_out, &task_info_outCnt);
  if ((_DWORD)v20)
  {
    v21 = v20;
    v22 = 0.0;
    if (RBSPIDExists(self->_pid))
    {
      rbs_process_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[RBSProcessHandle elapsedCPUTimeForFrontBoard].cold.2(v21, v23, v24, v25, v26, v27, v28, v29);

    }
  }
  else
  {
    v22 = (double)SDWORD2(v52) / 1000000.0 + (double)SDWORD1(v52) + (double)(int)v53 / 1000000.0 + (double)SHIDWORD(v52);
  }
  *(_QWORD *)v48 = 0;
  v49 = 0;
  v47 = 4;
  v38 = task_info(v19, 3u, v48, &v47);
  if (!(_DWORD)v38)
    return v22 + (double)v48[1] / 1000000.0 + (double)v48[0] + (double)SHIDWORD(v49) / 1000000.0 + (double)(int)v49;
  v39 = v38;
  if (RBSPIDExists(self->_pid))
  {
    rbs_process_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[RBSProcessHandle elapsedCPUTimeForFrontBoard].cold.2(v39, v40, v41, v42, v43, v44, v45, v46);

  }
  return v22;
}

- (RBSProcessHandle)initWithLaunchContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RBSProcessHandle *v8;

  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beforeTranslocationBundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_overrideExecutablePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (RBSProcessHandle *)-[RBSProcessHandle _initWithIdentity:beforeTranslocationBundlePath:executablePath:](self, v5, v6, v7);
  return v8;
}

- (_DWORD)_initWithIdentity:(void *)a3 beforeTranslocationBundlePath:(void *)a4 executablePath:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v13;
  objc_super v14;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithIdentity_beforeTranslocationBundlePath_executablePath_, a1, CFSTR("RBSProcessHandle.m"), 328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

    }
    v14.receiver = a1;
    v14.super_class = (Class)RBSProcessHandle;
    v11 = objc_msgSendSuper2(&v14, sel_init);
    a1 = v11;
    if (v11)
    {
      *((_QWORD *)v11 + 6) = 0;
      objc_storeStrong((id *)v11 + 9, a2);
      a1[16] = -1;
    }
  }

  return a1;
}

+ (void)clearAllHandles
{
  NSObject *v0;
  uint8_t v1[16];

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
  rbs_process_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_190CD6000, v0, OS_LOG_TYPE_DEFAULT, "Removing all cached process handles", v1, 2u);
  }

  objc_msgSend((id)__ProcessHandles, "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
}

- (RBSProcessLimitations)activeLimitations
{
  void *v2;
  void *v4;
  void *v5;

  if ((self->_data & 0x4000000000000000) != 0)
  {
    +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessHandle instance](self, "instance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "limitationsForInstance:error:", v5, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return (RBSProcessLimitations *)v2;
}

- (unint64_t)hash
{
  return -[RBSProcessIdentity hash](self->_identity, "hash") ^ self->_pid;
}

- (NSString)name
{
  NSString *cachedName;
  NSString **p_cachedName;
  NSString *v5;
  void *v6;
  void *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
  p_cachedName = &self->_cachedName;
  cachedName = self->_cachedName;
  if (cachedName)
  {
    v5 = cachedName;
    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
LABEL_4:
    os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
    objc_storeStrong((id *)p_cachedName, v5);
    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
    return v5;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processName:", v6);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
  return v5;
}

- (RBSProcessHandle)hostProcess
{
  void *v2;
  void *v4;
  void *v5;

  if ((self->_data & 0x4000000000000000) != 0)
  {
    +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessHandle instance](self, "instance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostProcessForInstance:error:", v5, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return (RBSProcessHandle *)v2;
}

- (NSString)beforeTranslocationBundlePath
{
  return 0;
}

- (RBSProcessHandle)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessHandle.m"), 148, CFSTR("-init is not allowed on RBSProcessHandle"));

  return 0;
}

- (RBSProcessExitContext)lastExitContext
{
  void *v2;
  void *v4;
  void *v5;

  if ((self->_data & 0x4000000000000000) != 0)
  {
    +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessHandle instance](self, "instance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastExitContextForInstance:error:", v5, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return (RBSProcessExitContext *)v2;
}

void __36__RBSProcessHandle_monitorForDeath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  RBSProcessExitContext *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  rbs_process_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_190CD6000, v4, OS_LOG_TYPE_DEFAULT, "Calling process death completion block for handle %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = a1 + 32;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v8 + 8);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v6, v3);
  }
  else
  {
    v9 = objc_alloc_init(RBSProcessExitContext);
    (*(void (**)(uint64_t, uint64_t, RBSProcessExitContext *))(v7 + 16))(v7, v6, v9);

  }
}

- (void)intendToExitWith:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  if ((self->_data & 0x4000000000000000) != 0)
  {
    +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessHandle instance](self, "instance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intendToExit:withStatus:", v14, v4);

  }
  else
  {
    rbs_general_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[RBSProcessHandle intendToExitWith:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (BOOL)isValid
{
  void *v2;
  char v3;

  -[RBSProcessHandle currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  return v3;
}

- (id)endowmentInfoForHandle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValues:", 32);
  +[RBSProcessPredicate predicateMatchingHandle:](RBSProcessPredicate, "predicateMatchingHandle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentStateMatchingDescriptor:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endowmentInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)platform
{
  return -[RBSProcessIdentity platform](self->_identity, "platform");
}

+ (id)handleForLegacyHandle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id *v8;

  v6 = a3;
  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "pid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v7, a4);
    v8 = (id *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_storeStrong(v8 + 3, a3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)legacyHandle
{
  RBSProcessHandle *v3;
  BSProcessHandle *legacyHandle;
  uint64_t v5;
  BSProcessHandle *v6;
  BSProcessHandle *v7;

  if (objc_opt_class())
  {
    v3 = self;
    objc_sync_enter(v3);
    legacyHandle = v3->_legacyHandle;
    if (!legacyHandle)
    {
      objc_msgSend(MEMORY[0x1E0D01830], "processHandleForAuditToken:", v3->_bsAuditToken);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v3->_legacyHandle;
      v3->_legacyHandle = (BSProcessHandle *)v5;

      legacyHandle = v3->_legacyHandle;
    }
    v7 = legacyHandle;
    objc_sync_exit(v3);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSString)daemonJobLabel
{
  void *v3;

  if (-[RBSProcessHandle isDaemon](self, "isDaemon"))
  {
    -[RBSProcessIdentity consistentLaunchdJobLabel](self->_identity, "consistentLaunchdJobLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)xpcServiceIdentifier
{
  return -[RBSProcessIdentity xpcServiceIdentifier](self->_identity, "xpcServiceIdentifier");
}

- (NSUUID)uuid
{
  return -[RBSProcessIdentity uuid](self->_identity, "uuid");
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t pid;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((self->_data & 0x4000000000000000) == 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend((id)objc_opt_class(), "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| inert %@>"), v4, v5, v15, v16, v17, v18);
LABEL_6:
    v13 = (void *)v6;
    goto LABEL_7;
  }
  -[RBSProcessHandle identity](self, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "auid");

  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
  v10 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v10;
  pid = self->_pid;
  if (!(_DWORD)v8)
  {
    v6 = objc_msgSend(v9, "initWithFormat:", CFSTR("<%@| %@:%d%@%@%@>"), v4, v10, pid, &stru_1E2D183D0, &stru_1E2D183D0, &stru_1E2D183D0);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("<%@| %@:%d%@%@%@>"), v4, v5, pid, CFSTR("("), v12, CFSTR(")"));

LABEL_7:
  return (NSString *)v13;
}

- (unsigned)euid
{
  return self->_euid;
}

+ (void)_cacheHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_190CD6000, a2, a3, "Unable to cache process handle without XID or PID: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)intendToExitWith:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, a1, a3, "intendToExitWith called for dummy handler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)handleForKey:(uint64_t)a3 fetchIfNeeded:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_190CD6000, a2, a3, "No process found for %llx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)elapsedCPUTimeForFrontBoard
{
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, a1, a3, "elapsedCPUTimeForFrontBoard couldn't generate a task port", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)encodeWithRBSXPCCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_190CD6000, a2, a3, "Encoding RBSProcessHandle with IPC ID %llx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)initWithRBSXPCCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_190CD6000, a2, a3, "Decoded RBSProcessHandle with IPC ID %llx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

@end
