@implementation WFContextualActionFilteringBehavior

- (WFContextualActionFilteringBehavior)initWithMatchingTypes:(id)a3 inClientPredicate:(id)a4 daemonPredicate:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFContextualActionFilteringBehavior *v13;
  WFContextualActionFilteringBehavior *v14;
  WFContextualActionFilteringBehavior *v15;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionFilteringBehavior.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matchingTypes"));

  }
  v18.receiver = self;
  v18.super_class = (Class)WFContextualActionFilteringBehavior;
  v13 = -[WFContextualActionFilteringBehavior init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_matchingTypes, a3);
    objc_storeStrong((id *)&v14->_inClientPredicate, a4);
    objc_storeStrong((id *)&v14->_daemonPredicate, a5);
    v15 = v14;
  }

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionFilteringBehavior matchingTypes](self, "matchingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionFilteringBehavior inClientPredicate](self, "inClientPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionFilteringBehavior daemonPredicate](self, "daemonPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p types=%@, files predicate=%@, thorough filtering predicate=%@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;

  v3 = (void *)objc_opt_new();
  -[WFContextualActionFilteringBehavior matchingTypes](self, "matchingTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFContextualActionFilteringBehavior matchingTypes](self, "matchingTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "combine:", v5);

  }
  -[WFContextualActionFilteringBehavior inClientPredicate](self, "inClientPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFContextualActionFilteringBehavior inClientPredicate](self, "inClientPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "combine:", v8);

  }
  -[WFContextualActionFilteringBehavior daemonPredicate](self, "daemonPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFContextualActionFilteringBehavior daemonPredicate](self, "daemonPredicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v3, "combine:", v11);

  }
  v13 = objc_msgSend(v3, "finalize");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  WFContextualActionFilteringBehavior *v4;
  WFContextualActionFilteringBehavior *v5;
  WFContextualActionFilteringBehavior *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (WFContextualActionFilteringBehavior *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[WFContextualActionFilteringBehavior matchingTypes](v6, "matchingTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionFilteringBehavior matchingTypes](self, "matchingTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_25;
      v15 = objc_msgSend(v9, "isEqualToSet:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[WFContextualActionFilteringBehavior inClientPredicate](v6, "inClientPredicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionFilteringBehavior inClientPredicate](self, "inClientPredicate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = objc_msgSend(v14, "isEqual:", v18);

      if (!v12)
        goto LABEL_25;
    }
    -[WFContextualActionFilteringBehavior daemonPredicate](v6, "daemonPredicate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionFilteringBehavior daemonPredicate](self, "daemonPredicate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23)
        LOBYTE(v12) = objc_msgSend(v20, "isEqual:", v23);
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (WFContextualActionFilteringBehavior)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFContextualActionFilteringBehavior *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("matchingTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inClientPredicate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daemonPredicate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[WFContextualActionFilteringBehavior initWithMatchingTypes:inClientPredicate:daemonPredicate:](self, "initWithMatchingTypes:inClientPredicate:daemonPredicate:", v8, v9, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *matchingTypes;
  id v5;

  matchingTypes = self->_matchingTypes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", matchingTypes, CFSTR("matchingTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inClientPredicate, CFSTR("inClientPredicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_daemonPredicate, CFSTR("daemonPredicate"));

}

- (NSSet)matchingTypes
{
  return self->_matchingTypes;
}

- (NSPredicate)inClientPredicate
{
  return self->_inClientPredicate;
}

- (NSPredicate)daemonPredicate
{
  return self->_daemonPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonPredicate, 0);
  objc_storeStrong((id *)&self->_inClientPredicate, 0);
  objc_storeStrong((id *)&self->_matchingTypes, 0);
}

+ (WFContextualActionFilteringBehavior)matchAllFiles
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CEC528]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithMatchingTypes:inClientPredicate:daemonPredicate:", v3, 0, 0);

  return (WFContextualActionFilteringBehavior *)v4;
}

+ (id)filteringWithMatchingTypes:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMatchingTypes:inClientPredicate:daemonPredicate:", v7, v6, 0);

  return v8;
}

+ (id)filteringWithMatchingTypes:(id)a3 predicate:(id)a4 daemonPredicate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContextualActionFilteringBehavior.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("daemonPredicate"));

  }
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMatchingTypes:inClientPredicate:daemonPredicate:", v9, v10, v11);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
