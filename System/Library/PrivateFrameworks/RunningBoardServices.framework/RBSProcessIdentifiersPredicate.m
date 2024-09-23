@implementation RBSProcessIdentifiersPredicate

- (BOOL)matchesProcess:(id)a3
{
  NSSet *identifiers;
  void *v4;
  void *v5;

  identifiers = self->super._identifiers;
  objc_msgSend(a3, "instance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifiers) = -[NSSet containsObject:](identifiers, "containsObject:", v5);

  return (char)identifiers;
}

- (RBSProcessIdentifiersPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  RBSProcessIdentifiersPredicate *v7;
  objc_super v9;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v5, objc_opt_class(), CFSTR("_identifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)RBSProcessIdentifiersPredicate;
    self = -[RBSProcessCollectionPredicateImpl initWithIdentifiers:](&v9, sel_initWithIdentifiers_, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (RBSProcessIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v5;
  RBSProcessIdentifiersPredicate *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessPredicate+Identifier.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

  }
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessIdentifiersPredicate;
  v6 = -[RBSProcessCollectionPredicateImpl initWithIdentifiers:](&v9, sel_initWithIdentifiers_, v5);

  return v6;
}

- (NSSet)processIdentifiers
{
  return self->super._identifiers;
}

@end
