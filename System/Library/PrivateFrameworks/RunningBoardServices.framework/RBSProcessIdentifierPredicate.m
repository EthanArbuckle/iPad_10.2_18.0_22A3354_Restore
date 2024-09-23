@implementation RBSProcessIdentifierPredicate

- (BOOL)matchesProcess:(id)a3
{
  return -[RBSProcessIdentifier matchesProcess:](self->_identifier, "matchesProcess:", a3);
}

- (RBSProcessIdentifierPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessIdentifierPredicate *v5;
  uint64_t v6;
  RBSProcessIdentifier *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessIdentifierPredicate;
  v5 = -[RBSProcessIdentifierPredicate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (RBSProcessIdentifier *)v6;

  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessIdentifierPredicate *v4;
  uint64_t v5;
  char v6;
  RBSProcessIdentifier *identifier;
  RBSProcessIdentifier *v8;
  BOOL v9;

  v4 = (RBSProcessIdentifierPredicate *)a3;
  if (self == v4)
    goto LABEL_10;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  identifier = self->_identifier;
  v8 = v4->_identifier;
  if (identifier == v8)
  {
LABEL_10:
    v6 = 1;
    goto LABEL_11;
  }
  if (identifier)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v6 = -[RBSProcessIdentifier isEqual:](identifier, "isEqual:");
    goto LABEL_11;
  }
LABEL_3:
  v6 = 0;
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSProcessIdentifierPredicate;
  v3 = -[RBSProcessPredicateImpl hash](&v5, sel_hash);
  return -[RBSProcessIdentifier hash](self->_identifier, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (RBSProcessIdentifierPredicate)initWithIdentifier:(id)a3
{
  id v6;
  RBSProcessIdentifierPredicate *v7;
  RBSProcessIdentifierPredicate *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessPredicate+Identifier.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)RBSProcessIdentifierPredicate;
  v7 = -[RBSProcessIdentifierPredicate init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_identifier, a3);

  return v8;
}

- (RBSProcessIdentifier)identifier
{
  return self->_identifier;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@>"), v4, self->_identifier);

  return v5;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", self);
}

@end
