@implementation REMReminderFetchExecutor

- (REMReminderFetchExecutor)initWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  REMReminderFetchExecutor *v11;
  REMReminderFetchExecutor *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMReminderFetchExecutor;
  v11 = -[REMReminderFetchExecutor init](&v14, sel_init);
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

- (REMReminderFetchExecutor)initWithCoder:(id)a3
{
  id v4;
  REMReminderFetchExecutor *v5;
  uint64_t v6;
  REMReminderPredicateDescriptor *predicateDescriptor;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *sortDescriptors;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REMReminderFetchExecutor;
  v5 = -[_REMFetchExecutor initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicateDescriptor"));
    v6 = objc_claimAutoreleasedReturnValue();
    predicateDescriptor = v5->_predicateDescriptor;
    v5->_predicateDescriptor = (REMReminderPredicateDescriptor *)v6;

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
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMReminderFetchExecutor;
  v4 = a3;
  -[_REMFetchExecutor encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[REMReminderFetchExecutor predicateDescriptor](self, "predicateDescriptor", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("predicateDescriptor"));

  -[REMReminderFetchExecutor sortDescriptors](self, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sortDescriptors"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMReminderFetchExecutor options](self, "options"), CFSTR("options"));
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
  -[REMReminderFetchExecutor predicateDescriptor](self, "predicateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderFetchExecutor sortDescriptors](self, "sortDescriptors");
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  REMAccount *v15;
  void *v16;
  id v17;
  void *v18;
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
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  REMReminder *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t n;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "fetchedAccountStorages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v64 = v6;
  objc_msgSend(v6, "fetchedAccountStorages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v83 != v13)
          objc_enumerationMutation(v10);
        v15 = -[REMAccount initWithStore:storage:]([REMAccount alloc], "initWithStore:storage:", v7, *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
        -[REMAccount objectID](v15, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
    }
    while (v12);
  }

  v17 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v64, "fetchedListStorages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend(v64, "fetchedListStorages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v79 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
        objc_msgSend(v25, "accountID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = -[REMList initWithStore:account:storage:]([REMList alloc], "initWithStore:account:storage:", v7, v27, v25);
        -[REMList objectID](v28, "objectID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, v29);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
    }
    while (v22);
  }

  v30 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v64, "fetchedReminderStorages");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithCapacity:", objc_msgSend(v31, "count"));

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v64, "fetchedReminderStorages");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v75;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v75 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
        objc_msgSend(v38, "listID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v38, "listID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = -[REMReminder initWithStore:list:storage:]([REMReminder alloc], "initWithStore:list:storage:", v7, v41, v38);
          -[REMReminder objectID](v42, "objectID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v42, v43);

        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
    }
    while (v35);
  }
  v63 = v19;

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(v32, "allValues");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v71;
    do
    {
      for (m = 0; m != v46; ++m)
      {
        if (*(_QWORD *)v71 != v47)
          objc_enumerationMutation(v44);
        v49 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
        objc_msgSend(v49, "storage");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "parentReminderID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          objc_msgSend(v32, "objectForKeyedSubscript:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setParentReminder:", v52);

        }
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
    }
    while (v46);
  }

  v53 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v64, "requestedObjectIDs");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v53, "initWithCapacity:", objc_msgSend(v54, "count"));

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v64, "requestedObjectIDs");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v67;
    do
    {
      for (n = 0; n != v58; ++n)
      {
        if (*(_QWORD *)v67 != v59)
          objc_enumerationMutation(v56);
        objc_msgSend(v32, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * n));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
          objc_msgSend(v55, "addObject:", v61);

      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
    }
    while (v58);
  }

  return v55;
}

- (id)resultsFromFetchResult:(id)a3 inList:(id)a4 error:(id *)a5
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
  REMReminder *v17;
  void *v18;
  REMReminder *v19;
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
  objc_msgSend(v6, "fetchedReminderStorages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = v6;
  objc_msgSend(v6, "fetchedReminderStorages");
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
        v17 = [REMReminder alloc];
        objc_msgSend(v7, "store");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[REMReminder initWithStore:list:storage:](v17, "initWithStore:list:storage:", v18, v7, v16);

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

- (id)resultsFromFetchResult:(id)a3 inParentReminder:(id)a4 error:(id *)a5
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
  REMReminder *v16;
  void *v17;
  void *v18;
  REMReminder *v19;
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
  objc_msgSend(v6, "fetchedReminderStorages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "fetchedReminderStorages");
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
        v16 = [REMReminder alloc];
        objc_msgSend(v7, "store");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "list");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[REMReminder initWithStore:list:storage:](v16, "initWithStore:list:storage:", v17, v18, v15);

        -[REMReminder setParentReminder:](v19, "setParentReminder:", v7);
        objc_msgSend(v10, "addObject:", v19);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  return v10;
}

- (REMReminderPredicateDescriptor)predicateDescriptor
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
