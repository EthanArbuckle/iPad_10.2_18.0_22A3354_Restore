@implementation WFCoreDataDatabaseResultConcatFetchRequestOperation

- (WFCoreDataDatabaseResultConcatFetchRequestOperation)initWithFetchRequests:(id)a3 resultsLimit:(int64_t)a4
{
  id v6;
  void *v7;
  WFCoreDataDatabaseResultConcatFetchRequestOperation *v8;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = -[WFCoreDataDatabaseResultConcatFetchRequestOperation initWithFetchRequests:resultsLimit:relationshipKeysAffectingDescriptors:](self, "initWithFetchRequests:resultsLimit:relationshipKeysAffectingDescriptors:", v6, a4, v7);

  return v8;
}

- (WFCoreDataDatabaseResultConcatFetchRequestOperation)initWithFetchRequests:(id)a3 resultsLimit:(int64_t)a4 relationshipKeysAffectingDescriptors:(id)a5
{
  id v8;
  id v9;
  WFCoreDataDatabaseResultConcatFetchRequestOperation *v10;
  uint64_t v11;
  NSArray *fetchRequests;
  uint64_t v13;
  NSSet *relationshipKeysAffectingDescriptors;
  WFCoreDataDatabaseResultConcatFetchRequestOperation *v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WFCoreDataDatabaseResultConcatFetchRequestOperation;
  v10 = -[WFCoreDataDatabaseResultConcatFetchRequestOperation init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    fetchRequests = v10->_fetchRequests;
    v10->_fetchRequests = (NSArray *)v11;

    v10->_resultsLimit = a4;
    v13 = objc_msgSend(v9, "copy");
    relationshipKeysAffectingDescriptors = v10->_relationshipKeysAffectingDescriptors;
    v10->_relationshipKeysAffectingDescriptors = (NSSet *)v13;

    v15 = v10;
  }

  return v10;
}

- (id)resultsWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[WFCoreDataDatabaseResultConcatFetchRequestOperation fetchRequests](self, "fetchRequests", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (-[WFCoreDataDatabaseResultConcatFetchRequestOperation resultsLimit](self, "resultsLimit") >= 1)
        {
          v14 = -[WFCoreDataDatabaseResultConcatFetchRequestOperation resultsLimit](self, "resultsLimit");
          v15 = v14 - objc_msgSend(v7, "count");
          v16 = objc_msgSend(v13, "fetchLimit");
          if (v16 >= v15)
            v17 = v15;
          else
            v17 = v16;
          objc_msgSend(v13, "setFetchLimit:", v17);
        }
        objc_msgSend(v6, "executeFetchRequest:error:", v13, a4);
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
        {

          v21 = 0;
          goto LABEL_20;
        }
        v19 = (void *)v18;
        objc_msgSend(v7, "addObjectsFromArray:", v18);
        if (-[WFCoreDataDatabaseResultConcatFetchRequestOperation resultsLimit](self, "resultsLimit") >= 1)
        {
          v20 = objc_msgSend(v7, "count");
          if (v20 >= -[WFCoreDataDatabaseResultConcatFetchRequestOperation resultsLimit](self, "resultsLimit"))
          {

            goto LABEL_19;
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_19:

  v21 = v7;
LABEL_20:

  return v21;
}

- (int64_t)countWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t i;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[WFCoreDataDatabaseResultConcatFetchRequestOperation fetchRequests](self, "fetchRequests", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v10 += objc_msgSend(v6, "countForFetchRequest:error:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), a4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  if (-[WFCoreDataDatabaseResultConcatFetchRequestOperation resultsLimit](self, "resultsLimit") >= 1)
  {
    v13 = -[WFCoreDataDatabaseResultConcatFetchRequestOperation resultsLimit](self, "resultsLimit");
    if (v10 >= v13)
      v10 = v13;
  }

  return v10;
}

- (NSEntityDescription)entity
{
  void *v2;
  void *v3;
  void *v4;

  -[WFCoreDataDatabaseResultConcatFetchRequestOperation fetchRequests](self, "fetchRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSEntityDescription *)v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  -[WFCoreDataDatabaseResultConcatFetchRequestOperation fetchRequests](self, "fetchRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("predicate.predicateFormat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, predicates: %@>"), v7, self, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[WFCoreDataDatabaseResultConcatFetchRequestOperation fetchRequests](self, "fetchRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[WFCoreDataDatabaseResultConcatFetchRequestOperation resultsLimit](self, "resultsLimit") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int64_t v13;
  BOOL v14;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  -[WFCoreDataDatabaseResultConcatFetchRequestOperation fetchRequests](self, "fetchRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {

  }
  else
  {
    if (!v9 || !v10)
    {

LABEL_14:
      v14 = 0;
      goto LABEL_15;
    }
    v12 = objc_msgSend(v9, "isEqualToArray:", v10);

    if (!v12)
      goto LABEL_14;
  }
  v13 = -[WFCoreDataDatabaseResultConcatFetchRequestOperation resultsLimit](self, "resultsLimit");
  v14 = v13 == objc_msgSend(v6, "resultsLimit");
LABEL_15:

  return v14;
}

- (NSSet)relationshipKeysAffectingDescriptors
{
  return self->_relationshipKeysAffectingDescriptors;
}

- (NSArray)fetchRequests
{
  return self->_fetchRequests;
}

- (int64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequests, 0);
  objc_storeStrong((id *)&self->_relationshipKeysAffectingDescriptors, 0);
}

@end
