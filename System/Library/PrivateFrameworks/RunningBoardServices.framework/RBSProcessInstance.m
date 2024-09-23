@implementation RBSProcessInstance

- (RBSProcessIdentifier)identifier
{
  return self->_identifier;
}

+ (RBSProcessInstance)instanceWithIdentifier:(id)a3 identity:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RBSProcessInstance _initWithIdentifier:identity:]([RBSProcessInstance alloc], v6, v5);

  return (RBSProcessInstance *)v7;
}

- (_QWORD)_initWithIdentifier:(void *)a3 identity:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  objc_super v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithIdentifier_identity_, a1, CFSTR("RBSProcessInstance.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

    }
    v14.receiver = a1;
    v14.super_class = (Class)RBSProcessInstance;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      v8 = objc_msgSend(v7, "copy");
      v9 = (void *)a1[1];
      a1[1] = v8;

      v10 = objc_msgSend(v5, "copy");
      v11 = (void *)a1[2];
      a1[2] = v10;

    }
  }

  return a1;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessInstance)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessInstance *v5;
  uint64_t v6;
  RBSProcessIdentifier *identifier;
  uint64_t v8;
  RBSProcessIdentity *identity;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RBSProcessInstance;
  v5 = -[RBSProcessInstance init](&v11, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pid")))
    {
      +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:");
      v6 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (RBSProcessIdentifier *)v6;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identity"));
    v8 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (RBSProcessIdentity *)v8;

  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  int v4;
  id v5;

  v5 = a3;
  v4 = -[RBSProcessIdentifier pid](self->_identifier, "pid");
  if (v4 >= 1)
    objc_msgSend(v5, "encodeInt64:forKey:", v4, CFSTR("pid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identity, CFSTR("_identity"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (unint64_t)hash
{
  return -[RBSProcessIdentifier pid](self->_identifier, "pid");
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessInstance *v4;
  uint64_t v5;
  int v6;
  void *v7;
  RBSProcessIdentity **p_identity;
  RBSProcessIdentity *identity;
  NSObject *v10;
  BOOL v11;

  v4 = (RBSProcessInstance *)a3;
  if (self != v4)
  {
    v5 = objc_opt_class();
    if (v5 != objc_opt_class()
      || (v6 = -[RBSProcessInstance rbs_pid](self, "rbs_pid"), v6 != -[RBSProcessInstance rbs_pid](v4, "rbs_pid")))
    {
      v11 = 0;
      goto LABEL_11;
    }
    -[RBSProcessInstance identity](v4, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    identity = self->_identity;
    p_identity = &self->_identity;
    if (!-[RBSProcessIdentity isEqual:](identity, "isEqual:", v7))
    {
      rbs_process_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[RBSProcessInstance isEqual:].cold.1((id *)p_identity, v7, v10);

    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (int)rbs_pid
{
  return -[RBSProcessIdentifier pid](self->_identifier, "pid");
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@:%d]"), v4, -[RBSProcessIdentifier rbs_pid](self->_identifier, "rbs_pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)copyWithAuid:(unsigned int)a3
{
  uint64_t v3;
  RBSProcessInstance *v5;
  RBSProcessIdentifier *identifier;
  id v7;
  _QWORD *v8;

  v3 = *(_QWORD *)&a3;
  v5 = [RBSProcessInstance alloc];
  identifier = self->_identifier;
  v7 = -[RBSProcessIdentity copyWithAuid:](self->_identity, "copyWithAuid:", v3);
  v8 = -[RBSProcessInstance _initWithIdentifier:identity:](v5, identifier, v7);

  return v8;
}

- (RBSProcessInstance)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessInstance.m"), 26, CFSTR("-init is not allowed on RBSProcessInstance"));

  return 0;
}

- (id)copyWithPersonaString:(id)a3
{
  id v4;
  RBSProcessInstance *v5;
  RBSProcessIdentifier *identifier;
  id v7;
  _QWORD *v8;

  v4 = a3;
  v5 = [RBSProcessInstance alloc];
  identifier = self->_identifier;
  v7 = -[RBSProcessIdentity copyWithPersonaString:](self->_identity, "copyWithPersonaString:", v4);

  v8 = -[RBSProcessInstance _initWithIdentifier:identity:](v5, identifier, v7);
  return v8;
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<pid=%d id=%@>"), -[RBSProcessInstance rbs_pid](self, "rbs_pid"), self->_identity);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)matchesProcess:(id)a3
{
  void *v4;

  objc_msgSend(a3, "instance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RBSProcessInstance isEqual:](self, "isEqual:", v4);

  return (char)self;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", self);
}

- (void)isEqual:(NSObject *)a3 .cold.1(id *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_fault_impl(&dword_190CD6000, a3, OS_LOG_TYPE_FAULT, "Two equal instances have unequal identities. %{public}@ and %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
