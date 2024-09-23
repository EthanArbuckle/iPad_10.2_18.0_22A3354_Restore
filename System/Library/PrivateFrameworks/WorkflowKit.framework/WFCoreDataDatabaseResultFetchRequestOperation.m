@implementation WFCoreDataDatabaseResultFetchRequestOperation

- (NSEntityDescription)entity
{
  void *v2;
  void *v3;

  -[WFCoreDataDatabaseResultFetchRequestOperation fetchRequest](self, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSEntityDescription *)v3;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (NSSet)relationshipKeysAffectingDescriptors
{
  return self->_relationshipKeysAffectingDescriptors;
}

- (int64_t)countWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  -[WFCoreDataDatabaseResultFetchRequestOperation fetchRequest](self, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "countForFetchRequest:error:", v7, a4);

  return v8;
}

- (WFCoreDataDatabaseResultFetchRequestOperation)initWithFetchRequest:(id)a3 relationshipKeysAffectingDescriptors:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFCoreDataDatabaseResultFetchRequestOperation *v11;
  WFCoreDataDatabaseResultFetchRequestOperation *v12;
  WFCoreDataDatabaseResultFetchRequestOperation *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabaseResult.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchRequest"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabaseResult.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relationshipKeysAffectingDescriptors"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFCoreDataDatabaseResultFetchRequestOperation;
  v11 = -[WFCoreDataDatabaseResultFetchRequestOperation init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fetchRequest, a3);
    objc_storeStrong((id *)&v12->_relationshipKeysAffectingDescriptors, a4);
    v13 = v12;
  }

  return v12;
}

- (id)resultsWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[WFCoreDataDatabaseResultFetchRequestOperation fetchRequest](self, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_relationshipKeysAffectingDescriptors, 0);
}

- (WFCoreDataDatabaseResultFetchRequestOperation)initWithFetchRequest:(id)a3
{
  id v4;
  void *v5;
  WFCoreDataDatabaseResultFetchRequestOperation *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[WFCoreDataDatabaseResultFetchRequestOperation initWithFetchRequest:relationshipKeysAffectingDescriptors:](self, "initWithFetchRequest:relationshipKeysAffectingDescriptors:", v4, v5);

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  -[WFCoreDataDatabaseResultFetchRequestOperation fetchRequest](self, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCoreDataDatabaseResultFetchRequestOperation fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p, type: %@, predicate: %@>"), v10, self, v4, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[WFCoreDataDatabaseResultFetchRequestOperation fetchRequest](self, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[WFCoreDataDatabaseResultFetchRequestOperation fetchRequest](self, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v5;

  return v8;
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
  char v12;

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
  -[WFCoreDataDatabaseResultFetchRequestOperation fetchRequest](self, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v7;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    v12 = 1;
  }
  else
  {
    v12 = 0;
    if (v9 && v10)
      v12 = objc_msgSend(v9, "isEqual:", v10);
  }

  return v12;
}

@end
