@implementation PLRelationshipOrderingState

- (PLRelationshipOrderingState)initWithObjectIDs:(id)a3 orderValues:(id)a4
{
  id v6;
  id v7;
  PLRelationshipOrderingState *v8;
  uint64_t v9;
  id oids;
  uint64_t v11;
  id foks;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLRelationshipOrderingState;
  v8 = -[PLRelationshipOrderingState init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    oids = v8->_oids;
    v8->_oids = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    foks = v8->_foks;
    v8->_foks = (id)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)PLRelationshipOrderingState;
  -[PLRelationshipOrderingState description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ isMutable=%d count=%d\n"), v4, self->_isMutable, objc_msgSend(self->_oids, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(self->_oids, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(self->_foks, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(self->_oids, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("  %@ -> %@\n"), v7, v8);

      ++v6;
    }
    while (objc_msgSend(self->_oids, "count") > v6);
  }
  return v5;
}

- (unint64_t)indexForObjectID:(id)a3
{
  return objc_msgSend(self->_oids, "indexOfObject:", a3);
}

- (BOOL)setOrderValue:(int64_t)a3 forObjectID:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  id oids;
  void *v11;
  id foks;
  unint64_t v13;
  _BYTE *v14;
  NSObject *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  unint64_t v26;
  int v28;
  unint64_t v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!self->_isMutable)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)objc_msgSend(self->_oids, "mutableCopy");
      oids = self->_oids;
      self->_oids = v9;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = (void *)objc_msgSend(self->_foks, "mutableCopy");
      foks = self->_foks;
      self->_foks = v11;

    }
    self->_isMutable = 1;
  }
  v13 = objc_msgSend(self->_oids, "count");
  v14 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (v13 < a5)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_msgSend(self->_oids, "count");
        v28 = 134218240;
        v29 = a5;
        v30 = 2048;
        v31 = v16;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Target index %ld is too large, count of object IDs is %ld", (uint8_t *)&v28, 0x16u);
      }

    }
    a5 = objc_msgSend(self->_oids, "count");
  }
  v17 = objc_msgSend(self->_oids, "indexOfObject:", v8);
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = -1;
  }
  else
  {
    objc_msgSend(self->_foks, "objectAtIndex:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "longLongValue");

  }
  if (v18 != a3)
  {
    if (!*v14)
    {
      __CPLAssetsdOSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v28 = 134218754;
        v29 = v18;
        v30 = 2048;
        v31 = a3;
        v32 = 2048;
        v33 = a5;
        v34 = 2112;
        v35 = v8;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Assigning updated order value (was %lld) to %lld (idx %ld) for %@", (uint8_t *)&v28, 0x2Au);
      }

    }
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(self->_oids, "insertObject:atIndex:", v8, a5);
      v21 = self->_foks;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "insertObject:atIndex:", v22, a5);
LABEL_25:

      goto LABEL_30;
    }
    if (v17 == a5)
    {
      v23 = self->_foks;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "replaceObjectAtIndex:withObject:", a5, v22);
      goto LABEL_25;
    }
    objc_msgSend(self->_oids, "insertObject:atIndex:", v8, a5);
    v24 = self->_foks;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "insertObject:atIndex:", v25, a5);

    if (v17 <= a5)
      v26 = v17;
    else
      v26 = v17 + 1;
    objc_msgSend(self->_oids, "removeObjectAtIndex:", v26);
    objc_msgSend(self->_foks, "removeObjectAtIndex:", v26);
  }
LABEL_30:

  return v18 != a3;
}

- (id)orderKeys
{
  return self->_foks;
}

- (id)objectIDs
{
  return self->_oids;
}

- (unint64_t)findIndexForObjectID:(id)a3 newOrderValue:(int64_t)a4 hasOrderValueConflictWithObjectID:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  unsigned int v16;

  v8 = a3;
  if (objc_msgSend(self->_foks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(self->_foks, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(self->_foks, "count"), 1024, &__block_literal_global_20663);
    if (v10 >= objc_msgSend(self->_oids, "count"))
    {
      if (a5)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(self->_foks, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqual:", v9))
      {
        objc_msgSend(self->_oids, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v8);

        if (!a5)
        {
          v14 = v13 ^ 1;
          if (!v10)
            goto LABEL_17;
LABEL_15:
          if ((v14 & 1) == 0)
          {
            objc_msgSend(self->_oids, "objectAtIndexedSubscript:", v10 - 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v8);

            v10 -= v16;
          }
          goto LABEL_17;
        }
        if ((v13 & 1) == 0)
        {
          objc_msgSend(self->_oids, "objectAtIndexedSubscript:", v10);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

          goto LABEL_18;
        }
LABEL_9:
        v14 = 0;
        *a5 = 0;
        if (!v10)
          goto LABEL_17;
        goto LABEL_15;
      }

      if (a5)
        goto LABEL_9;
    }
    v14 = 0;
    if (!v10)
      goto LABEL_17;
    goto LABEL_15;
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_foks, 0);
  objc_storeStrong(&self->_oids, 0);
}

uint64_t __100__PLRelationshipOrderingState_findIndexForObjectID_newOrderValue_hasOrderValueConflictWithObjectID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end
