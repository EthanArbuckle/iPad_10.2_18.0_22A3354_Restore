@implementation REMListFetchExecutor

- (REMListFetchExecutor)initWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  REMListFetchExecutor *v11;
  REMListFetchExecutor *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMListFetchExecutor;
  v11 = -[REMListFetchExecutor init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_predicateDescriptor, a3);
    objc_storeStrong((id *)&v12->_sortDescriptors, a4);
    v12->_options = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListFetchExecutor)initWithCoder:(id)a3
{
  id v4;
  REMListFetchExecutor *v5;
  uint64_t v6;
  REMListPredicateDescriptor *predicateDescriptor;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *sortDescriptors;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REMListFetchExecutor;
  v5 = -[_REMFetchExecutor initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicateDescriptor"));
    v6 = objc_claimAutoreleasedReturnValue();
    predicateDescriptor = v5->_predicateDescriptor;
    v5->_predicateDescriptor = (REMListPredicateDescriptor *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("sortDescriptors"));
    v11 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v11;

    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[REMListFetchExecutor predicateDescriptor](self, "predicateDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("predicateDescriptor"));

  -[REMListFetchExecutor sortDescriptors](self, "sortDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("sortDescriptors"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[REMListFetchExecutor options](self, "options"), CFSTR("options"));
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMListFetchExecutor predicateDescriptor](self, "predicateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListFetchExecutor sortDescriptors](self, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p predicate: %@, sortDescriptors: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)resultsFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  REMAccount *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  REMList *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id obj;
  id obja;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "fetchedAccountStorages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v42 = v6;
  objc_msgSend(v6, "fetchedAccountStorages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(v11);
        v16 = -[REMAccount initWithStore:storage:]([REMAccount alloc], "initWithStore:storage:", v7, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
        -[REMAccount objectID](v16, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v13);
  }

  v18 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v42, "fetchedListStorages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithCapacity:", objc_msgSend(v19, "count"));

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v42, "fetchedListStorages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v50 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(v25, "accountID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = -[REMList initWithStore:account:storage:]([REMList alloc], "initWithStore:account:storage:", v7, v27, v25);
        -[REMList objectID](v28, "objectID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, v29);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v22);
  }

  v30 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v42, "requestedObjectIDs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithCapacity:", objc_msgSend(v31, "count"));

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v42, "requestedObjectIDs");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(obja);
        objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "storage");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "parentListID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setParentList:", v40);

        }
        objc_msgSend(v32, "addObject:", v37);

      }
      v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v34);
  }

  return v32;
}

- (id)resultsFromFetchResult:(id)a3 inAccount:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  REMList *v17;
  void *v18;
  REMList *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "fetchedListStorages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = v6;
  objc_msgSend(v6, "fetchedListStorages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
        v17 = [REMList alloc];
        objc_msgSend(v7, "store");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[REMList initWithStore:account:storage:](v17, "initWithStore:account:storage:", v18, v7, v16);

        objc_msgSend(v10, "addObject:", v19);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  return v10;
}

- (id)resultsFromFetchResult:(id)a3 inParentList:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  REMList *v16;
  void *v17;
  void *v18;
  REMList *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "fetchedListStorages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "fetchedListStorages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v16 = [REMList alloc];
        objc_msgSend(v7, "store");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "account");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[REMList initWithStore:account:storage:](v16, "initWithStore:account:storage:", v17, v18, v15);

        -[REMList setParentList:](v19, "setParentList:", v7);
        objc_msgSend(v10, "addObject:", v19);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  return v10;
}

- (REMListPredicateDescriptor)predicateDescriptor
{
  return self->_predicateDescriptor;
}

- (void)setPredicateDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_predicateDescriptor, a3);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptors, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicateDescriptor, 0);
}

@end
