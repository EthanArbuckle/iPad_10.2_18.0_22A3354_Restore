@implementation RBSCompoundAllPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSSet count](self->_predicates, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_predicates;
    v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "matchesProcess:", v4, (_QWORD)v12))
          {
            v10 = 0;
            goto LABEL_12;
          }
        }
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_12:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_predicates, CFSTR("_predicates"));
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSCompoundAllPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSCompoundAllPredicate *v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *predicates;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSCompoundAllPredicate;
  v5 = -[RBSCompoundAllPredicate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("_predicates"));
    v7 = objc_claimAutoreleasedReturnValue();
    predicates = v5->_predicates;
    v5->_predicates = (NSSet *)v7;

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_predicates, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ [%@]>"), v4, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  RBSCompoundAllPredicate *v4;
  uint64_t v5;
  char v6;
  NSSet *predicates;
  const __CFSet *v8;
  BOOL v9;
  CFIndex Count;

  v4 = (RBSCompoundAllPredicate *)a3;
  if (self == v4)
    goto LABEL_11;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  predicates = self->_predicates;
  v8 = (const __CFSet *)v4->_predicates;
  if (predicates == (NSSet *)v8)
  {
LABEL_11:
    v6 = 1;
    goto LABEL_12;
  }
  if (predicates)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    Count = CFSetGetCount((CFSetRef)predicates);
    if (Count == CFSetGetCount(v8))
    {
      v6 = -[NSSet isEqualToSet:](predicates, "isEqualToSet:", v8);
      goto LABEL_12;
    }
  }
LABEL_3:
  v6 = 0;
LABEL_12:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicates, 0);
}

- (_QWORD)initWithPredicates:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)RBSCompoundAllPredicate;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

- (id)processIdentifiers
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_predicates;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "processIdentifiers", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if (v5)
          {
            objc_msgSend(v5, "setByAddingObjectsFromSet:", v8);
            v10 = objc_claimAutoreleasedReturnValue();

            v5 = (id)v10;
          }
          else
          {
            v5 = v8;
          }
        }

      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)processIdentifier
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_predicates;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "processIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if (v5)
          {
            rbs_general_log();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v13 = 0;
              _os_log_impl(&dword_190CD6000, v10, OS_LOG_TYPE_DEFAULT, "Failed to get processIdentifier for predicate with multiple possibilities", v13, 2u);
            }

            v11 = 0;
            goto LABEL_17;
          }
          v5 = v8;
        }

      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }

  v5 = v5;
  v11 = v5;
LABEL_17:

  return v11;
}

@end
