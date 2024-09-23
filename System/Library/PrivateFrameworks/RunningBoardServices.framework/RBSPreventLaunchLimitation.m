@implementation RBSPreventLaunchLimitation

+ (id)limitationWithPredicate:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = -[RBSPreventLaunchLimitation _initWithPredicate:andException:]((id *)objc_alloc((Class)a1), v4, 0);

  return v5;
}

- (id)_initWithPredicate:(void *)a3 andException:
{
  id v6;
  id v7;
  id *v8;
  void *v10;
  objc_super v11;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPredicate_andException_, a1, CFSTR("RBSPreventLaunchLimitation.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

    }
    v11.receiver = a1;
    v11.super_class = (Class)RBSPreventLaunchLimitation;
    v8 = (id *)objc_msgSendSuper2(&v11, sel__init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

+ (id)limitationWithPredicate:(id)a3 andException:(id)a4
{
  id v6;
  id v7;
  id *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[RBSPreventLaunchLimitation _initWithPredicate:andException:]((id *)objc_alloc((Class)a1), v7, v6);

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@ allow:%@>"), v4, self->_predicate, self->_allow);

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessPredicate *allow;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)RBSPreventLaunchLimitation;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v6, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_predicate, CFSTR("_predicate"));
  allow = self->_allow;
  if (allow)
    objc_msgSend(v4, "encodeObject:forKey:", allow, CFSTR("_allow"));

}

- (RBSPreventLaunchLimitation)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSPreventLaunchLimitation *v5;
  uint64_t v6;
  RBSProcessPredicate *predicate;
  uint64_t v8;
  RBSProcessPredicate *allow;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RBSPreventLaunchLimitation;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v11, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_predicate"));
    v6 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (RBSProcessPredicate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_allow"));
    v8 = objc_claimAutoreleasedReturnValue();
    allow = v5->_allow;
    v5->_allow = (RBSProcessPredicate *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RBSPreventLaunchLimitation *v4;
  uint64_t v5;
  char v6;
  RBSProcessPredicate *predicate;
  RBSProcessPredicate *v8;
  BOOL v9;
  RBSProcessPredicate *allow;
  RBSProcessPredicate *v11;
  BOOL v12;

  v4 = (RBSPreventLaunchLimitation *)a3;
  if (self == v4)
    goto LABEL_16;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  predicate = self->_predicate;
  v8 = v4->_predicate;
  if (predicate != v8)
  {
    v9 = !predicate || v8 == 0;
    if (v9 || !-[RBSProcessPredicate isEqual:](predicate, "isEqual:"))
      goto LABEL_3;
  }
  allow = self->_allow;
  v11 = v4->_allow;
  if (allow == v11)
  {
LABEL_16:
    v6 = 1;
    goto LABEL_17;
  }
  if (allow)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    v6 = -[RBSProcessPredicate isEqual:](allow, "isEqual:");
    goto LABEL_17;
  }
LABEL_3:
  v6 = 0;
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[RBSProcessPredicate hash](self->_predicate, "hash");
  return -[RBSProcessPredicate hash](self->_allow, "hash") ^ v3;
}

- (RBSProcessPredicate)predicate
{
  return self->_predicate;
}

- (RBSProcessPredicate)allow
{
  return self->_allow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allow, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
