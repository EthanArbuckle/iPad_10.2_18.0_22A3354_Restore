@implementation RBSProcessPredicate

- (unint64_t)hash
{
  return -[RBSProcessPredicateImpl hash](self->_predicate, "hash");
}

- (BOOL)matchesProcess:(id)a3
{
  return -[RBSProcessPredicateImpl matchesProcess:](self->_predicate, "matchesProcess:", a3);
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessPredicate *v5;
  uint64_t v6;
  RBSProcessPredicateImpl *predicate;

  v4 = a3;
  v5 = -[RBSProcessPredicate init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_predicate"));
    v6 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (RBSProcessPredicateImpl *)v6;

  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_predicate, CFSTR("_predicate"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@>"), v4, self->_predicate);

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessPredicate *v4;
  uint64_t v5;
  char v6;
  RBSProcessPredicateImpl *predicate;
  RBSProcessPredicateImpl *v8;

  v4 = (RBSProcessPredicate *)a3;
  if (self == v4)
    goto LABEL_8;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v6 = 0;
    goto LABEL_9;
  }
  predicate = self->_predicate;
  v8 = v4->_predicate;
  if (predicate == v8)
  {
LABEL_8:
    v6 = 1;
    goto LABEL_9;
  }
  v6 = 0;
  if (predicate && v8)
    v6 = -[RBSProcessPredicateImpl isEqual:](predicate, "isEqual:");
LABEL_9:

  return v6;
}

+ (id)predicateMatchingBundleIdentifiers:(id)a3
{
  id v3;
  RBSProcessBundleIdentifiersPredicate *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessBundleIdentifiersPredicate initWithIdentifiers:]([RBSProcessBundleIdentifiersPredicate alloc], "initWithIdentifiers:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingIdentifiers:(id)a3
{
  id v3;
  RBSProcessIdentifiersPredicate *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessIdentifiersPredicate initWithIdentifiers:]([RBSProcessIdentifiersPredicate alloc], "initWithIdentifiers:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingHandle:(id)a3
{
  id v3;
  RBSProcessHandlePredicateImpl *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessHandlePredicateImpl initWithHandle:]([RBSProcessHandlePredicateImpl alloc], "initWithHandle:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingBundleIdentifier:(id)a3
{
  id v3;
  RBSProcessBundleIdentifierPredicate *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessStringPredicate initWithIdentifier:]([RBSProcessBundleIdentifierPredicate alloc], "initWithIdentifier:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingEuid:(unsigned int)a3
{
  RBSProcessEUIDPredicate *v3;
  void *v4;

  v3 = -[RBSProcessIntPredicate initWithIdentifier:]([RBSProcessEUIDPredicate alloc], "initWithIdentifier:", a3);
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (RBSProcessIdentity)processIdentity
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  RBSProcessIdentity *v6;

  -[RBSProcessPredicate predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
    v5 = (void *)v4[1];
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)predicateMatchingIdentifier:(id)a3
{
  id v3;
  RBSProcessInstancePredicate *v4;
  RBSProcessInstancePredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[RBSProcessIdentifierPredicate initWithIdentifier:]([RBSProcessInstancePredicate alloc], "initWithIdentifier:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = [RBSProcessInstancePredicate alloc];
      objc_msgSend(v3, "instance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[RBSProcessIdentifierPredicate initWithIdentifier:](v5, "initWithIdentifier:", v6);

    }
    else
    {
      +[RBSProcessIdentifier identifierForIdentifier:](RBSProcessIdentifier, "identifierForIdentifier:", v3);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = -[RBSProcessIdentifierPredicate initWithIdentifier:]([RBSProcessIdentifierPredicate alloc], "initWithIdentifier:", v7);
      v3 = (id)v7;
    }
  }
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateMatchingPredicates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "predicate", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v12 = (uint64_t)-[RBSCompoundAllPredicate initWithPredicates:]([RBSCompoundAllPredicate alloc], v5);
  }
  v13 = (void *)v12;

  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:", v13);
  return v14;
}

+ (id)predicateMatching:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSProcessPredicate.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:", v5);
  }
  else
  {
    objc_msgSend(v5, "processPredicate");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (RBSProcessPredicate)initWithPredicate:(id)a3
{
  id v6;
  RBSProcessPredicate *v7;
  RBSProcessPredicate *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (v6)
  {
    NSClassFromString(CFSTR("RBSProcessPredicateImpl"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessPredicate.m"), 67, CFSTR("Invalid condition not satisfying: %@"), CFSTR("[object isKindOfClass:RBSProcessPredicateImplClass]"));

    }
  }

  v11.receiver = self;
  v11.super_class = (Class)RBSProcessPredicate;
  v7 = -[RBSProcessPredicate init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_predicate, a3);

  return v8;
}

- (id)processIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  void *v23;

  -[RBSProcessPredicate predicate](self, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "processIdentifiers");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (id)v6;
LABEL_6:

    return v7;
  }
  -[RBSProcessPredicate predicate](self, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "processIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v7 = v11;
  }
  else
  {
    -[RBSProcessPredicate predicate](self, "predicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    objc_msgSend(v15, "processIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v7 = v16;
    }
    else
    {
      -[RBSProcessPredicate predicate](self, "predicate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      objc_msgSend(v20, "processIdentifiers");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  if (!v7)
  {
    -[RBSProcessPredicate processIdentifier](self, "processIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v22 = (void *)MEMORY[0x1E0C99E60];
      +[RBSProcessIdentifier identifierForIdentifier:](RBSProcessIdentifier, "identifierForIdentifier:", v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWithObject:", v23);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    goto LABEL_6;
  }
  return v7;
}

- (RBSProcessPredicateImpl)predicate
{
  return self->_predicate;
}

- (id)processIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[RBSProcessPredicate predicate](self, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[RBSProcessPredicate predicate](self, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "processIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v8 = v12;
    }
    else
    {
      -[RBSProcessPredicate predicate](self, "predicate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      objc_msgSend(v16, "processIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v8 = v17;
      }
      else
      {
        -[RBSProcessPredicate predicate](self, "predicate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
        v21 = v20;

        objc_msgSend(v21, "processIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v8 = v22;
        }
        else
        {
          -[RBSProcessPredicate predicate](self, "predicate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v25 = v24;
          else
            v25 = 0;
          v26 = v25;

          objc_msgSend(v26, "processIdentifier");
          v8 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

    }
  }

  return v8;
}

+ (id)predicateMatchingTarget:(id)a3
{
  return +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", a3);
}

+ (id)predicateMatchingProcessTypeApplication
{
  RBSProcessPredicateTypeApplication *v2;
  void *v3;

  v2 = objc_alloc_init(RBSProcessPredicateTypeApplication);
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)predicatePowerLogProcesses
{
  return +[RBSProcessReportedProcesses reportedPredicate](RBSProcessReportedProcesses, "reportedPredicate");
}

+ (id)predicateForSymptomsd
{
  return +[RBSProcessReportedProcesses reportedPredicate](RBSProcessReportedProcesses, "reportedPredicate");
}

+ (id)predicateForMemoryMonitor
{
  return +[RBSProcessReportedProcesses reportedPredicate](RBSProcessReportedProcesses, "reportedPredicate");
}

+ (id)predicateForClearTheBoard
{
  return +[RBSProcessReportedProcesses reportedPredicate](RBSProcessReportedProcesses, "reportedPredicate");
}

+ (id)predicate
{
  return objc_alloc_init((Class)a1);
}

+ (id)predicateMatchingAnyPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "predicate", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v12 = (uint64_t)-[RBSCompoundAnyPredicate initWithPredicates:]([RBSCompoundAnyPredicate alloc], v5);
  }
  v13 = (void *)v12;

  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:", v13);
  return v14;
}

+ (id)predicateNotMatchingPredicate:(id)a3
{
  id v4;
  id v5;
  RBSNotPredicate *v6;
  void *v7;
  id *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = [RBSNotPredicate alloc];
  objc_msgSend(v4, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[RBSNotPredicate initNotWithPredicate:]((id *)&v6->super.super.isa, v7);
  v9 = (void *)objc_msgSend(v5, "initWithPredicate:", v8);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RBSProcessPredicate initWithPredicate:](+[RBSProcessPredicate allocWithZone:](RBSProcessPredicate, "allocWithZone:", a3), "initWithPredicate:", self->_predicate);
}

+ (id)predicateMatchingAuid:(unsigned int)a3
{
  RBSProcessAUIDPredicate *v3;
  void *v4;

  v3 = -[RBSProcessIntPredicate initWithIdentifier:]([RBSProcessAUIDPredicate alloc], "initWithIdentifier:", a3);
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unsigned)euid
{
  void *v2;
  void *v3;
  id v4;
  unsigned int v5;

  -[RBSProcessPredicate predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "identifier");
  return v5;
}

- (unsigned)auid
{
  void *v2;
  void *v3;
  id v4;
  unsigned int v5;

  -[RBSProcessPredicate predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "identifier");
  return v5;
}

+ (id)predicateMatchingPlatform:(int)a3
{
  RBSProcessPlatformPredicate *v3;
  void *v4;

  v3 = -[RBSProcessPlatformPredicate initWithPlatform:]([RBSProcessPlatformPredicate alloc], "initWithPlatform:", *(_QWORD *)&a3);
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateMatchingExtensionPoint:(id)a3
{
  id v3;
  RBSProcessExtensionPointPredicate *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessStringPredicate initWithIdentifier:]([RBSProcessExtensionPointPredicate alloc], "initWithIdentifier:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingBeforeTranslocationBundlePath:(id)a3
{
  id v3;
  RBSProcessBeforeTranslocationBundlePathPredicate *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessBeforeTranslocationBundlePathPredicate initWithIdentifier:]([RBSProcessBeforeTranslocationBundlePathPredicate alloc], "initWithIdentifier:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingExecPathStartsWith:(id)a3
{
  id v3;
  RBSProcessExecPathStartsWithPredicate *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessStringPredicate initWithIdentifier:]([RBSProcessExecPathStartsWithPredicate alloc], "initWithIdentifier:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingDextsBundledWithBundleID:(id)a3
{
  id v3;
  RBSProcessBundledDextPredicate *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessStringPredicate initWithIdentifier:]([RBSProcessBundledDextPredicate alloc], "initWithIdentifier:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingLSApplicationIdentity:(id)a3
{
  void *v3;
  void *v4;

  +[RBSProcessIdentity identityForLSApplicationIdentity:](RBSProcessIdentity, "identityForLSApplicationIdentity:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessPredicate predicateMatchingIdentity:](RBSProcessPredicate, "predicateMatchingIdentity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[RBSProcessPredicate predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)extensionPoint
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[RBSProcessPredicate predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)beforeTranslocationBundlePath
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[RBSProcessPredicate predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "beforeTranslocationBundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (id)predicateMatchingHostIdentifier:(id)a3
{
  id v3;
  RBSProcessHostIdentifierPredicate *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessIdentifierPredicate initWithIdentifier:]([RBSProcessHostIdentifierPredicate alloc], "initWithIdentifier:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingLaunchServicesProcesses
{
  RBSProcessPredicateLaunchServicesProcesses *v2;
  void *v3;

  v2 = objc_alloc_init(RBSProcessPredicateLaunchServicesProcesses);
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)predicateMatchingSuspendableProcesses
{
  RBSProcessPredicateSuspendable *v2;
  void *v3;

  v2 = objc_alloc_init(RBSProcessPredicateSuspendable);
  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)predicateMatchingJobLabel:(id)a3
{
  id v3;
  RBSProcessLaunchdJobLabelPredicate *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessStringPredicate initWithIdentifier:]([RBSProcessLaunchdJobLabelPredicate alloc], "initWithIdentifier:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingServiceName:(id)a3
{
  id v3;
  RBSProcessServiceNamePredicate *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessStringPredicate initWithIdentifier:]([RBSProcessServiceNamePredicate alloc], "initWithIdentifier:", v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingIdentity:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = -[RBSProcessIdentityPredicate initWithIdentity:]([RBSProcessIdentityPredicate alloc], v3);

  +[RBSProcessPredicate predicateMatching:](RBSProcessPredicate, "predicateMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)jobLabel
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[RBSProcessPredicate predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)serviceName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[RBSProcessPredicate predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

@end
