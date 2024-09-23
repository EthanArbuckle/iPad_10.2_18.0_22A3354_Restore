@implementation RBSProcessIdentityPredicate

- (_QWORD)initWithIdentity:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  objc_super v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithIdentity_, a1, CFSTR("RBSProcessPredicate+Identity.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

    }
    v9.receiver = a1;
    v9.super_class = (Class)RBSProcessIdentityPredicate;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v5 = objc_msgSend(v4, "copy");
      v6 = (void *)a1[1];
      a1[1] = v5;

    }
  }

  return a1;
}

- (BOOL)matchesProcess:(id)a3
{
  return -[RBSProcessIdentity matchesProcess:](self->_identity, "matchesProcess:", a3);
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", self);
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSProcessIdentityPredicate;
  v3 = -[RBSProcessPredicateImpl hash](&v5, sel_hash);
  return -[RBSProcessIdentity hash](self->_identity, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessIdentityPredicate *v4;
  uint64_t v5;
  char v6;
  RBSProcessIdentity *identity;
  RBSProcessIdentity *v8;
  RBSProcessIdentity *v9;
  RBSProcessIdentity *v10;
  BOOL v11;

  v4 = (RBSProcessIdentityPredicate *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      identity = self->_identity;
      if (v4)
        v8 = v4->_identity;
      else
        v8 = 0;
      v9 = v8;
      v10 = v9;
      if (identity == v9)
      {
        v6 = 1;
      }
      else
      {
        if (identity)
          v11 = v9 == 0;
        else
          v11 = 1;
        if (v11)
          v6 = 0;
        else
          v6 = -[RBSProcessIdentity isEqual:](identity, "isEqual:", v9);
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@>"), v4, self->_identity);

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identity, CFSTR("_identity"));
}

- (RBSProcessIdentityPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessIdentityPredicate *v5;
  uint64_t v6;
  RBSProcessIdentity *identity;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessIdentityPredicate;
  v5 = -[RBSProcessIdentityPredicate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identity"));
    v6 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (RBSProcessIdentity *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
