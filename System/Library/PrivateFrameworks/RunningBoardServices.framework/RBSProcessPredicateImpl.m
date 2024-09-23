@implementation RBSProcessPredicateImpl

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (id)processIdentifiers
{
  RBSProcessPredicateImpl *v2;
  RBSProcessPredicateImpl *v3;
  RBSProcessPredicateImpl *v4;
  uint64_t v5;
  id v6;
  RBSProcessPredicateImpl *v7;
  RBSProcessPredicateImpl *v8;
  RBSProcessPredicateImpl *v9;
  void *v10;
  void *v11;
  RBSProcessPredicateImpl *v12;
  RBSProcessPredicateImpl *v13;
  RBSProcessPredicateImpl *v14;
  void *v15;
  void *v16;
  RBSProcessPredicateImpl *v17;
  RBSProcessPredicateImpl *v18;
  RBSProcessPredicateImpl *v19;
  void *v21;
  void *v22;

  v2 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  -[RBSProcessPredicateImpl processIdentifiers](v4, "processIdentifiers");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (id)v5;
LABEL_6:

    return v6;
  }
  v7 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  -[RBSProcessPredicateImpl processIdentifiers](v9, "processIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v6 = v10;
  }
  else
  {
    v12 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    -[RBSProcessPredicateImpl processIdentifiers](v14, "processIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v6 = v15;
    }
    else
    {
      v17 = v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      -[RBSProcessPredicateImpl processIdentifiers](v19, "processIdentifiers");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  if (!v6)
  {
    -[RBSProcessPredicateImpl processIdentifier](v7, "processIdentifier");
    v4 = (RBSProcessPredicateImpl *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v21 = (void *)MEMORY[0x1E0C99E60];
      +[RBSProcessIdentifier identifierForIdentifier:](RBSProcessIdentifier, "identifierForIdentifier:", v4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithObject:", v22);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    goto LABEL_6;
  }
  return v6;
}

- (id)processIdentifier
{
  RBSProcessPredicateImpl *v2;
  RBSProcessPredicateImpl *v3;
  RBSProcessPredicateImpl *v4;
  void *v5;
  void *v6;
  id v7;
  RBSProcessPredicateImpl *v8;
  RBSProcessPredicateImpl *v9;
  RBSProcessPredicateImpl *v10;
  void *v11;
  void *v12;
  RBSProcessPredicateImpl *v13;
  RBSProcessPredicateImpl *v14;
  RBSProcessPredicateImpl *v15;
  void *v16;
  void *v17;
  RBSProcessPredicateImpl *v18;
  RBSProcessPredicateImpl *v19;
  RBSProcessPredicateImpl *v20;
  void *v21;
  void *v22;
  RBSProcessPredicateImpl *v23;
  RBSProcessPredicateImpl *v24;
  RBSProcessPredicateImpl *v25;

  v2 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  -[RBSProcessPredicateImpl identifier](v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    -[RBSProcessPredicateImpl processIdentifier](v10, "processIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v7 = v11;
    }
    else
    {
      v13 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      -[RBSProcessPredicateImpl processIdentifier](v15, "processIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v7 = v16;
      }
      else
      {
        v18 = v13;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
        v20 = v19;

        -[RBSProcessPredicateImpl processIdentifier](v20, "processIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v7 = v21;
        }
        else
        {
          v23 = v18;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v24 = v23;
          else
            v24 = 0;
          v25 = v24;

          -[RBSProcessPredicateImpl processIdentifier](v25, "processIdentifier");
          v7 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

    }
  }

  return v7;
}

- (NSString)description
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("<%@>"), v3);

  return (NSString *)v4;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", self);
}

- (BOOL)matchesProcess:(id)a3
{
  BOOL result;

  objc_opt_class();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  return result;
}

@end
