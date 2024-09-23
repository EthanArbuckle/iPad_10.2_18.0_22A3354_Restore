@implementation RBSProcessCollectionPredicateImpl

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifiers, CFSTR("_identifiers"));
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessCollectionPredicateImpl)initWithIdentifiers:(id)a3
{
  id v5;
  RBSProcessCollectionPredicateImpl *v6;
  uint64_t v7;
  NSSet *identifiers;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessPredicate.m"), 361, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

  }
  v11.receiver = self;
  v11.super_class = (Class)RBSProcessCollectionPredicateImpl;
  v6 = -[RBSProcessCollectionPredicateImpl init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    identifiers = v6->_identifiers;
    v6->_identifiers = (NSSet *)v7;

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (unint64_t)hash
{
  return -[NSSet hash](self->_identifiers, "hash");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@>"), v4, self->_identifiers);

  return v5;
}

- (BOOL)matchesProcess:(id)a3
{
  return 0;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", self);
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessCollectionPredicateImpl *v4;
  uint64_t v5;
  char v6;
  NSSet *identifiers;
  NSSet *v8;
  BOOL v9;

  v4 = (RBSProcessCollectionPredicateImpl *)a3;
  if (self == v4)
    goto LABEL_10;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  identifiers = self->_identifiers;
  v8 = v4->_identifiers;
  if (identifiers == v8)
  {
LABEL_10:
    v6 = 1;
    goto LABEL_11;
  }
  if (identifiers)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v6 = -[NSSet isEqual:](identifiers, "isEqual:");
    goto LABEL_11;
  }
LABEL_3:
  v6 = 0;
LABEL_11:

  return v6;
}

@end
