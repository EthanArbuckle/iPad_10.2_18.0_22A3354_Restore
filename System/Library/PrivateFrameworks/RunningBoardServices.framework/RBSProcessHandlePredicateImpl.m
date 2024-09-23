@implementation RBSProcessHandlePredicateImpl

- (BOOL)matchesProcess:(id)a3
{
  int pid;
  char v4;
  RBSProcessIdentity *identity;
  uint64_t v6;
  void *v7;
  BOOL v8;

  pid = self->_pid;
  if (pid != -1)
    return pid == objc_msgSend(a3, "pid");
  identity = self->_identity;
  objc_msgSend(a3, "identity");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (identity == (RBSProcessIdentity *)v6)
  {
    v4 = 1;
  }
  else
  {
    if (identity)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
      v4 = 0;
    else
      v4 = -[RBSProcessIdentity isEqual:](identity, "isEqual:", v6);
  }

  return v4;
}

- (RBSProcessHandlePredicateImpl)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessHandlePredicateImpl *v5;
  uint64_t v6;
  RBSProcessIdentity *identity;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessHandlePredicateImpl;
  v5 = -[RBSProcessHandlePredicateImpl init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identity"));
    v6 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (RBSProcessIdentity *)v6;

    v5->_pid = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_pid"));
  }

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  RBSProcessIdentity *identity;
  id v5;

  identity = self->_identity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identity, CFSTR("_identity"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_pid, CFSTR("_pid"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessHandlePredicateImpl *v4;
  uint64_t v5;
  RBSProcessIdentity *identity;
  RBSProcessIdentity *v7;
  BOOL v8;
  char v10;

  v4 = (RBSProcessHandlePredicateImpl *)a3;
  if (self == v4)
    goto LABEL_11;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class() || self->_pid != v4->_pid)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_12;
  }
  identity = self->_identity;
  v7 = v4->_identity;
  if (identity == v7)
  {
LABEL_11:
    v10 = 1;
    goto LABEL_12;
  }
  if (identity)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
    goto LABEL_10;
  v10 = -[RBSProcessIdentity isEqual:](identity, "isEqual:");
LABEL_12:

  return v10;
}

- (RBSProcessHandlePredicateImpl)initWithHandle:(id)a3
{
  id v5;
  RBSProcessHandlePredicateImpl *v6;
  uint64_t v7;
  RBSProcessIdentity *identity;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessPredicate+Identifier.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

  }
  v11.receiver = self;
  v11.super_class = (Class)RBSProcessHandlePredicateImpl;
  v6 = -[RBSProcessHandlePredicateImpl init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "identity");
    v7 = objc_claimAutoreleasedReturnValue();
    identity = v6->_identity;
    v6->_identity = (RBSProcessIdentity *)v7;

    v6->_pid = objc_msgSend(v5, "pid");
  }

  return v6;
}

- (id)processIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pid);
}

- (unint64_t)hash
{
  if (self->_pid == -1)
    return -[RBSProcessIdentity hash](self->_identity, "hash");
  else
    return self->_pid;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@:%d>"), v4, self->_identity, self->_pid);

  return v5;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", self);
}

@end
