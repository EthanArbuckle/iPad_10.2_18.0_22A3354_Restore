@implementation RBSTerminateRequest

- (RBSTerminateRequest)initWithPredicate:(id)a3 context:(id)a4
{
  return (RBSTerminateRequest *)-[RBSTerminateRequest initWithPredicate:context:allowLaunch:service:]((id *)&self->super.super.isa, a3, a4, 0, 0);
}

- (id)initWithPredicate:(void *)a3 context:(void *)a4 allowLaunch:(void *)a5 service:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id *v16;
  uint64_t v17;
  id v18;
  objc_super v20;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    objc_msgSend(v11, "explanation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      rbs_assertion_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[RBSTerminateRequest initWithPredicate:context:allowLaunch:service:].cold.1(v15);

      objc_msgSend(v11, "setExplanation:", CFSTR("<no explanation given>"));
    }
    v20.receiver = a1;
    v20.super_class = (Class)RBSTerminateRequest;
    v16 = (id *)objc_msgSendSuper2(&v20, sel__init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 3, a2);
      objc_storeStrong(a1 + 4, a4);
      v17 = objc_msgSend(v11, "copy");
      v18 = a1[5];
      a1[5] = (id)v17;

      objc_storeStrong(a1 + 1, a5);
    }
  }

  return a1;
}

- (RBSTerminateRequest)initWithProcessIdentity:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  RBSTerminateRequest *v10;
  RBSTerminateRequest *v11;
  RBSTerminateRequest *v12;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "isEmbeddedApplication"))
  {
    objc_msgSend(v7, "embeddedApplicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RBSTerminateRequest initWithPredicate:context:](self, "initWithPredicate:context:", v9, v6);

    v11 = v10;
  }
  else
  {
    +[RBSProcessPredicate predicateMatchingIdentity:](RBSProcessPredicate, "predicateMatchingIdentity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[RBSTerminateRequest initWithPredicate:context:](self, "initWithPredicate:context:", v8, v6);
    v11 = v12;
  }

  return v11;
}

- (RBSTerminateRequest)initWithProcessIdentifier:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  RBSTerminateRequest *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSTerminateRequest.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processIdentifier != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSTerminateRequest.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  +[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[RBSTerminateRequest initWithPredicate:context:](self, "initWithPredicate:context:", v10, v9);

  return v11;
}

- (id)initForAllManagedWithReason:(id)a3 service:(id)a4
{
  id v7;
  id v8;
  RBSTerminateContext *v9;
  id *v10;
  id *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSTerminateRequest.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v9 = -[RBSTerminateContext initWithExplanation:]([RBSTerminateContext alloc], "initWithExplanation:", v7);
  -[RBSTerminateContext setReportType:](v9, "setReportType:", 0);
  -[RBSTerminateContext setPreventIfBeingDebugged:](v9, "setPreventIfBeingDebugged:", 0);
  v14.receiver = self;
  v14.super_class = (Class)RBSTerminateRequest;
  v10 = -[RBSRequest _init](&v14, sel__init);
  v11 = v10;
  if (v10)
  {
    *((_BYTE *)v10 + 16) = 1;
    objc_storeStrong(v10 + 5, v9);
    objc_storeStrong(v11 + 1, a4);
  }

  return v11;
}

- (id)initForAllManagedWithReason:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RBSTerminateRequest initForAllManagedWithReason:service:](self, "initForAllManagedWithReason:service:", v4, v5);

  return v6;
}

- (BOOL)execute:(id *)a3
{
  return -[RBSTerminateRequest execute:error:](self, "execute:error:", 0, a3);
}

- (BOOL)execute:(id *)a3 error:(id *)a4
{
  RBSProcessPredicate *predicate;
  RBSTerminateContext *context;
  void *v9;
  void *v10;
  RBSServiceLocalProtocol *service;
  RBSServiceLocalProtocol *v12;
  RBSServiceLocalProtocol *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    predicate = self->_predicate;
    if (predicate)
    {
      context = self->_context;
      +[RBSPreventLaunchLimitation limitationWithPredicate:andException:](RBSPreventLaunchLimitation, "limitationWithPredicate:andException:", predicate, self->_allow);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBSTerminateContext setAttributes:](context, "setAttributes:", v10);

    }
  }
  service = self->_service;
  if (!service)
  {
    +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
    v12 = (RBSServiceLocalProtocol *)objc_claimAutoreleasedReturnValue();
    v13 = self->_service;
    self->_service = v12;

    service = self->_service;
  }
  return -[RBSServiceLocalProtocol executeTerminateRequest:assertion:error:](service, "executeTerminateRequest:assertion:error:", self, a3, a4);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[RBSProcessPredicate hash](self->_predicate, "hash");
  return -[RBSTerminateContext hash](self->_context, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  RBSTerminateRequest *v4;
  uint64_t v5;
  RBSTerminateContext *context;
  RBSTerminateContext *v7;
  BOOL v8;
  RBSProcessPredicate *predicate;
  RBSProcessPredicate *v10;
  BOOL v11;
  RBSProcessPredicate *allow;
  RBSProcessPredicate *v13;
  BOOL v14;
  char v16;

  v4 = (RBSTerminateRequest *)a3;
  if (self == v4)
    goto LABEL_23;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class() || self->_targetsAllManagedProcesses != v4->_targetsAllManagedProcesses)
    goto LABEL_22;
  context = self->_context;
  v7 = v4->_context;
  if (context != v7)
  {
    v8 = !context || v7 == 0;
    if (v8 || !-[RBSTerminateContext isEqual:](context, "isEqual:"))
      goto LABEL_22;
  }
  predicate = self->_predicate;
  v10 = v4->_predicate;
  if (predicate != v10)
  {
    v11 = !predicate || v10 == 0;
    if (v11 || !-[RBSProcessPredicate isEqual:](predicate, "isEqual:"))
      goto LABEL_22;
  }
  allow = self->_allow;
  v13 = v4->_allow;
  if (allow == v13)
  {
LABEL_23:
    v16 = 1;
    goto LABEL_24;
  }
  if (allow)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (v14)
  {
LABEL_22:
    v16 = 0;
    goto LABEL_24;
  }
  v16 = -[RBSProcessPredicate isEqual:](allow, "isEqual:");
LABEL_24:

  return v16;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  RBSProcessPredicate *allow;
  RBSProcessPredicate *predicate;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_targetsAllManagedProcesses)
  {
    allow = (RBSProcessPredicate *)CFSTR("none");
    predicate = (RBSProcessPredicate *)CFSTR("all-managed");
  }
  else
  {
    predicate = self->_predicate;
    allow = self->_allow;
  }
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| predicate:%@ allow:%@ context:%@>"), v4, predicate, allow, self->_context);

  return (NSString *)v8;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessPredicate *predicate;
  RBSProcessPredicate *allow;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_targetsAllManagedProcesses)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("_targetsAllManagedProcesses"));
  }
  else
  {
    predicate = self->_predicate;
    if (predicate)
      objc_msgSend(v4, "encodeObject:forKey:", predicate, CFSTR("_predicate"));
    allow = self->_allow;
    if (allow)
      objc_msgSend(v7, "encodeObject:forKey:", allow, CFSTR("_allow"));
  }
  objc_msgSend(v7, "encodeObject:forKey:", self->_context, CFSTR("_context"));

}

- (RBSTerminateRequest)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSTerminateRequest *v5;
  uint64_t v6;
  RBSProcessPredicate *predicate;
  uint64_t v8;
  RBSProcessPredicate *allow;
  uint64_t v10;
  RBSTerminateContext *context;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSTerminateRequest;
  v5 = -[RBSRequest _init](&v13, sel__init);
  if (v5)
  {
    v5->_targetsAllManagedProcesses = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_targetsAllManagedProcesses"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_predicate"));
    v6 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (RBSProcessPredicate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_allow"));
    v8 = objc_claimAutoreleasedReturnValue();
    allow = v5->_allow;
    v5->_allow = (RBSProcessPredicate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_context"));
    v10 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (RBSTerminateContext *)v10;

  }
  return v5;
}

- (BOOL)targetsAllManagedProcesses
{
  return self->_targetsAllManagedProcesses;
}

- (RBSProcessPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (RBSProcessPredicate)allow
{
  return self->_allow;
}

- (void)setAllow:(id)a3
{
  objc_storeStrong((id *)&self->_allow, a3);
}

- (RBSTerminateContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_allow, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)initWithPredicate:(os_log_t)log context:allowLaunch:service:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_190CD6000, log, OS_LOG_TYPE_FAULT, "Explanation must be set in the RBSTerminateContext before using it to initialize a RBSTerminateRequest", v1, 2u);
}

@end
