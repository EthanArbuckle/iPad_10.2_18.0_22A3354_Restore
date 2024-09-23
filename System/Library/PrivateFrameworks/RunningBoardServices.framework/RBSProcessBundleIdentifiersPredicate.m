@implementation RBSProcessBundleIdentifiersPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "embeddedApplicationIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;

  }
  else
  {
    objc_msgSend(v4, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v9 = 0;
      goto LABEL_5;
    }
  }
  v9 = -[NSSet containsObject:](self->super._identifiers, "containsObject:", v7);

LABEL_5:
  return v9;
}

- (RBSProcessBundleIdentifiersPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  RBSProcessBundleIdentifiersPredicate *v7;
  objc_super v9;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v5, objc_opt_class(), CFSTR("_identifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)RBSProcessBundleIdentifiersPredicate;
    self = -[RBSProcessCollectionPredicateImpl initWithIdentifiers:](&v9, sel_initWithIdentifiers_, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (RBSProcessBundleIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v5;
  RBSProcessBundleIdentifiersPredicate *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessPredicate+Bundles.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers"));

  }
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessBundleIdentifiersPredicate;
  v6 = -[RBSProcessCollectionPredicateImpl initWithIdentifiers:](&v9, sel_initWithIdentifiers_, v5);

  return v6;
}

@end
