@implementation RBSTarget

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (RBSProcessIdentifier)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)shortDescription
{
  RBSTarget *v2;
  NSString *shortDescription;
  NSString **p_environment;
  void *v5;
  uint64_t v6;
  RBSProcessIdentity *processIdentity;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;

  v2 = self;
  objc_sync_enter(v2);
  shortDescription = v2->_shortDescription;
  if (!shortDescription)
  {
    if (v2->_processIdentifier)
    {
      p_environment = &v2->_environment;
      v5 = (void *)MEMORY[0x1E0CB3940];
      if (v2->_environment)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RBSProcessIdentifier pid](v2->_processIdentifier, "pid"));
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v8 = (NSString *)v6;
        objc_msgSend(v5, "stringWithFormat:", CFSTR("%@<%@>"), v6, *p_environment);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v12 = v2->_shortDescription;
        v2->_shortDescription = (NSString *)v9;

        shortDescription = v8;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RBSProcessIdentifier pid](v2->_processIdentifier, "pid"));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      processIdentity = v2->_processIdentity;
      if (!processIdentity)
      {
        if (v2->_endpoint)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@>"), v2->_endpoint);
          v11 = objc_claimAutoreleasedReturnValue();
          shortDescription = v2->_shortDescription;
          v2->_shortDescription = (NSString *)v11;
        }
        else
        {
          v2->_shortDescription = (NSString *)CFSTR("system");
        }
        goto LABEL_15;
      }
      p_environment = &v2->_environment;
      v5 = (void *)MEMORY[0x1E0CB3940];
      if (v2->_environment)
      {
        -[RBSProcessIdentity shortDescription](processIdentity, "shortDescription");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      -[RBSProcessIdentity shortDescription](processIdentity, "shortDescription");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (NSString *)v10;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v10);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_16:
  objc_sync_exit(v2);

  return v2->_shortDescription;
}

- (NSString)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_processIdentifier, 0);
}

- (BOOL)isSystem
{
  return !self->_processIdentifier && !self->_processIdentity && !self->_environment && self->_endpoint == 0;
}

void __27__RBSTarget_currentProcess__block_invoke()
{
  RBSTarget *v0;
  _QWORD *v1;
  void *v2;
  id v3;

  v0 = [RBSTarget alloc];
  +[RBSProcessIdentifier identifierForCurrentProcess](RBSProcessIdentifier, "identifierForCurrentProcess");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:](v0, v3, 0, 0, 0);
  v2 = (void *)currentProcess_currentProcess;
  currentProcess_currentProcess = (uint64_t)v1;

}

+ (RBSTarget)targetWithEndpoint:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v8;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSTarget.m"), 87, CFSTR("must specify an endpoint"));

  }
  if (MEMORY[0x194019424](v5) != MEMORY[0x1E0C81308])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSTarget.m"), 88, CFSTR("must specify a valid endpoint"));

  }
  v6 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:]([RBSTarget alloc], 0, 0, 0, v5, 0);

  return (RBSTarget *)v6;
}

+ (RBSTarget)targetWithPid:(int)a3 environmentIdentifier:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if ((int)v4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSTarget.m"), 78, CFSTR("must specify a valid pid"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSTarget targetWithProcessIdentifier:environmentIdentifier:](RBSTarget, "targetWithProcessIdentifier:environmentIdentifier:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (RBSTarget *)v9;
}

+ (RBSTarget)targetWithProcessIdentifier:(id)a3 environmentIdentifier:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]([RBSTarget alloc], v6, 0, v5, 0);

  return (RBSTarget *)v7;
}

+ (RBSTarget)targetWithProcessIdentity:(id)a3
{
  id v3;
  _QWORD *v4;

  v3 = a3;
  v4 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]([RBSTarget alloc], 0, v3, 0, 0);

  return (RBSTarget *)v4;
}

+ (RBSTarget)targetWithPid:(int)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSTarget targetWithProcessIdentifier:](RBSTarget, "targetWithProcessIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (RBSTarget *)v4;
}

+ (RBSTarget)targetWithProcessIdentifier:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v8;

  v5 = a3;
  if ((int)objc_msgSend(v5, "rbs_pid") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSTarget.m"), 73, CFSTR("must specify a valid pid"));

  }
  v6 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]([RBSTarget alloc], v5, 0, 0, 0);

  return (RBSTarget *)v6;
}

- (_QWORD)_initWithProcessIdentifier:(void *)a3 processIdentity:(void *)a4 environmentIdentifier:(uint64_t)a5 euid:
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;

  if (a1)
  {
    v9 = a4;
    v10 = a3;
    v11 = a2;
    v12 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:]([RBSTarget alloc], v11, v10, v9, 0, a5);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (RBSTarget)initWithRBSXPCCoder:(id)a3
{
  id v5;
  void *v6;
  Class v7;
  NSObject *v8;
  RBSTarget *v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("endpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processIdentity"));
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:](self, v10, v8, v11, 0, 0);

    v9 = self;
    goto LABEL_10;
  }
  v7 = NSClassFromString(CFSTR("RBLaunchdProperties"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSTarget.m"), 138, CFSTR("attempt to decode endpoint-based target outside the daemon"));

  }
  -[objc_class processIdentityForEndpoint:](v7, "processIdentityForEndpoint:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_9;
  rbs_coder_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[RBSTarget initWithRBSXPCCoder:].cold.1((uint64_t)v6, v8);
  v9 = 0;
LABEL_10:

  return v9;
}

- (_QWORD)_initWithProcessIdentifier:(void *)a3 processIdentity:(void *)a4 environmentIdentifier:(void *)a5 endpoint:(uint64_t)a6 euid:
{
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  xpc_object_t v22;
  void *v23;
  objc_super v25;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)RBSTarget;
    v15 = objc_msgSendSuper2(&v25, sel_init);
    a1 = v15;
    if (v15)
    {
      if (v11)
      {
        +[RBSProcessIdentifier identifierForIdentifier:](RBSProcessIdentifier, "identifierForIdentifier:", v11);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)a1[1];
        a1[1] = v16;
      }
      else
      {
        v17 = (void *)v15[1];
        v15[1] = 0;
      }

      if ((_DWORD)a6)
        v18 = objc_msgSend(v12, "copyWithAuid:", a6);
      else
        v18 = objc_msgSend(v12, "copy");
      v19 = (void *)a1[2];
      a1[2] = v18;

      v20 = objc_msgSend(v13, "copy");
      v21 = (void *)a1[3];
      a1[3] = v20;

      if (v14)
      {
        v22 = xpc_copy(v14);
        v23 = (void *)a1[4];
        a1[4] = v22;

      }
    }
  }

  return a1;
}

- (id)processPredicate
{
  void *v2;

  if (self->_endpoint)
  {
    v2 = (void *)objc_opt_new();
  }
  else
  {
    if (self->_processIdentity)
      +[RBSProcessPredicate predicateMatchingIdentity:](RBSProcessPredicate, "predicateMatchingIdentity:");
    else
      +[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", self->_processIdentifier);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  RBSProcessIdentifier *processIdentifier;
  id v5;

  processIdentifier = self->_processIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", processIdentifier, CFSTR("processIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_processIdentity, CFSTR("processIdentity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_environment, CFSTR("environment"));
  objc_msgSend(v5, "encodeXPCObject:forKey:", self->_endpoint, CFSTR("endpoint"));

}

+ (id)currentProcess
{
  if (currentProcess_onceToken != -1)
    dispatch_once(&currentProcess_onceToken, &__block_literal_global_1);
  return (id)currentProcess_currentProcess;
}

+ (id)systemTarget
{
  if (systemTarget_onceToken != -1)
    dispatch_once(&systemTarget_onceToken, &__block_literal_global_8);
  return (id)systemTarget_systemTarget;
}

void __25__RBSTarget_systemTarget__block_invoke()
{
  _QWORD *v0;
  void *v1;

  v0 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]([RBSTarget alloc], 0, 0, 0, 0);
  v1 = (void *)systemTarget_systemTarget;
  systemTarget_systemTarget = (uint64_t)v0;

}

+ (RBSTarget)targetWithProcessIdentity:(id)a3 environmentIdentifier:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]([RBSTarget alloc], 0, v6, v5, 0);

  return (RBSTarget *)v7;
}

- (RBSTarget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSTarget.m"), 93, CFSTR("-init is not allowed on RBSTarget"));

  return 0;
}

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  char v5;
  void *processIdentity;

  v4 = a3;
  if (self->_endpoint)
  {
    v5 = 0;
  }
  else
  {
    processIdentity = self->_processIdentity;
    if (!processIdentity)
      processIdentity = self->_processIdentifier;
    v5 = objc_msgSend(processIdentity, "matchesProcess:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  OS_xpc_object *endpoint;
  unint64_t v5;
  unint64_t v6;

  endpoint = self->_endpoint;
  if (endpoint)
    return xpc_hash(endpoint);
  v5 = -[RBSProcessIdentifier hash](self->_processIdentifier, "hash");
  v6 = -[RBSProcessIdentity hash](self->_processIdentity, "hash") ^ v5;
  return v6 ^ -[NSString hash](self->_environment, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RBSTarget *v4;
  uint64_t v5;
  BOOL v6;
  RBSProcessIdentifier *processIdentifier;
  RBSProcessIdentity *processIdentity;
  NSString *environment;
  OS_xpc_object *endpoint;
  OS_xpc_object *v12;

  v4 = (RBSTarget *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && ((processIdentifier = self->_processIdentifier, processIdentifier == v4->_processIdentifier)
       || -[RBSProcessIdentifier isEqual:](processIdentifier, "isEqual:"))
      && ((processIdentity = self->_processIdentity, processIdentity == v4->_processIdentity)
       || -[RBSProcessIdentity isEqual:](processIdentity, "isEqual:"))
      && ((environment = self->_environment, environment == v4->_environment)
       || -[NSString isEqualToString:](environment, "isEqualToString:")))
    {
      endpoint = self->_endpoint;
      v12 = v4->_endpoint;
      if (endpoint && v12)
        v6 = xpc_equal(endpoint, v12);
      else
        v6 = endpoint == v12;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)debugDescription
{
  OS_xpc_object *endpoint;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  RBSProcessIdentifier *processIdentifier;
  __CFString *v10;
  void *v11;

  endpoint = self->_endpoint;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (endpoint)
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; endpoint: %@>"), v6, self, self->_endpoint);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    processIdentifier = self->_processIdentifier;
    if (processIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RBSProcessIdentifier pid](self->_processIdentifier, "pid"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("(n/a)");
    }
    -[RBSProcessIdentity shortDescription](self->_processIdentity, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; pid: %@; identity: %@; environment: %@>"),
      v7,
      self,
      v10,
      v11,
      self->_environment);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (processIdentifier)
  }

  return (NSString *)v8;
}

- (id)copyWithPersonaString:(id)a3
{
  id v4;
  RBSTarget *v5;
  RBSProcessIdentifier *processIdentifier;
  id v7;
  _QWORD *v8;

  v4 = a3;
  v5 = [RBSTarget alloc];
  processIdentifier = self->_processIdentifier;
  v7 = -[RBSProcessIdentity copyWithPersonaString:](self->_processIdentity, "copyWithPersonaString:", v4);

  v8 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:](v5, processIdentifier, v7, self->_environment, self->_endpoint, 0);
  return v8;
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void)initWithRBSXPCCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_190CD6000, a2, OS_LOG_TYPE_ERROR, "no identity found for endpoint %@", (uint8_t *)&v2, 0xCu);
}

@end
