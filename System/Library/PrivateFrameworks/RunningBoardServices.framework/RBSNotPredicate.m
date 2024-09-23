@implementation RBSNotPredicate

- (id)initNotWithPredicate:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)RBSNotPredicate;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)processIdentifier
{
  return -[RBSProcessPredicateImpl processIdentifier](self->_predicate, "processIdentifier");
}

- (id)processIdentifiers
{
  return -[RBSProcessPredicateImpl processIdentifiers](self->_predicate, "processIdentifiers");
}

- (BOOL)matchesProcess:(id)a3
{
  return !-[RBSProcessPredicateImpl matchesProcess:](self->_predicate, "matchesProcess:", a3);
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_predicate, CFSTR("_predicate"));
}

- (RBSNotPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSNotPredicate *v5;
  uint64_t v6;
  RBSProcessPredicateImpl *predicate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSNotPredicate;
  v5 = -[RBSNotPredicate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_predicate"));
    v6 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (RBSProcessPredicateImpl *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RBSNotPredicate *v4;
  uint64_t v5;
  char v6;
  RBSProcessPredicateImpl *predicate;
  RBSProcessPredicateImpl *v8;
  BOOL v9;

  v4 = (RBSNotPredicate *)a3;
  if (self == v4)
    goto LABEL_10;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  predicate = self->_predicate;
  v8 = v4->_predicate;
  if (predicate == v8)
  {
LABEL_10:
    v6 = 1;
    goto LABEL_11;
  }
  if (predicate)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v6 = -[RBSProcessPredicateImpl isEqual:](predicate, "isEqual:");
    goto LABEL_11;
  }
LABEL_3:
  v6 = 0;
LABEL_11:

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
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ [%@]>"), v4, self->_predicate);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
