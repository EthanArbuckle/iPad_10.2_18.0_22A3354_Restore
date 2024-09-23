@implementation REMChangeSet

+ (id)errorChangeSetWithError:(id)a3
{
  id v3;
  REMChangeSet *v4;

  v3 = a3;
  v4 = -[REMChangeSet initWithError:]([REMChangeSet alloc], "initWithError:", v3);

  return v4;
}

- (REMChangeSet)initWithError:(id)a3
{
  id v5;
  REMChangeSet *v6;
  REMChangeSet *v7;
  NSArray *transactions;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMChangeSet;
  v6 = -[REMChangeSet init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    transactions = v7->_transactions;
    v7->_transactions = (NSArray *)MEMORY[0x1E0C9AA60];

    v7->_isTruncated = objc_msgSend(v5, "code") == 4;
  }

  return v7;
}

- (REMChangeSet)initWithChangeTransactions:(id)a3
{
  id v5;
  REMChangeSet *v6;
  REMChangeSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMChangeSet;
  v6 = -[REMChangeSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transactions, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  NSUInteger v11;
  void *v12;
  void *v13;

  v12 = (void *)MEMORY[0x1E0CB3940];
  v11 = -[NSArray count](self->_transactions, "count");
  -[NSArray firstObject](self->_transactions, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "changes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "changeID");
  -[NSArray lastObject](self->_transactions, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("REMChangeSet<%p>: {raw-txn-count=%lu, chg-ids-from=%lld, chg-ids-to=%lld}; {filtered-txn-count=%lu, cnsld-inserts=%lu, cnsld-updates=%lu, #cnsld-deletes=%lu}; {error=%@}"),
    self,
    v11,
    v10,
    objc_msgSend(v7, "changeID"),
    -[NSArray count](self->_filteredTransactions, "count"),
    -[NSArray count](self->_inserts, "count"),
    -[NSArray count](self->_updates, "count"),
    -[NSArray count](self->_deletes, "count"),
    self->_error);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)consolidateAndFilterChangesWithTransactionAuthors:(id)a3 isExclusion:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  NSObject *v17;
  NSError *v18;
  NSError *error;
  int v20;
  REMChangeSet *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[REMChangeSet isTruncated](self, "isTruncated"))
  {
    -[REMChangeSet error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[REMChangeSet filteredTransactions](self, "filteredTransactions");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        -[REMChangeSet filterByTransactionAuthorStrings](self, "filterByTransactionAuthorStrings");
        v12 = objc_claimAutoreleasedReturnValue();
        if ((id)v12 == v6)
        {
          v16 = -[REMChangeSet filterByTransactionAuthorsIsExclusion](self, "filterByTransactionAuthorsIsExclusion");

          if (v16 == v4)
            goto LABEL_16;
        }
        else
        {
          v13 = (void *)v12;
          -[REMChangeSet filterByTransactionAuthorStrings](self, "filterByTransactionAuthorStrings");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "isEqual:", v6) & 1) != 0)
          {
            v15 = -[REMChangeSet filterByTransactionAuthorsIsExclusion](self, "filterByTransactionAuthorsIsExclusion");

            if (v15 == v4)
              goto LABEL_16;
          }
          else
          {

          }
        }
      }
      -[REMChangeSet setFilterByTransactionAuthorStrings:](self, "setFilterByTransactionAuthorStrings:", v6);
      -[REMChangeSet setFilterByTransactionAuthorsIsExclusion:](self, "setFilterByTransactionAuthorsIsExclusion:", v4);
      +[REMLog changeTracking](REMLog, "changeTracking");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v20 = 134218498;
        v21 = self;
        v22 = 1024;
        v23 = v4;
        v24 = 2114;
        v25 = v6;
        _os_log_debug_impl(&dword_1B4A39000, v17, OS_LOG_TYPE_DEBUG, "REMChangeSet applyFilterByTransactionAuthors: {self=%p, exclude=%d, authors=%{public}@}", (uint8_t *)&v20, 0x1Cu);
      }

      if (!-[REMChangeSet _filterAndFlattenAndConsolidateChanges](self, "_filterAndFlattenAndConsolidateChanges"))
      {
        if (!self->_error)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithREMChangeErrorCode:", 5);
          v18 = (NSError *)objc_claimAutoreleasedReturnValue();
          error = self->_error;
          self->_error = v18;

        }
        goto LABEL_3;
      }
LABEL_16:
      v8 = 1;
      goto LABEL_4;
    }
  }
LABEL_3:
  v8 = 0;
LABEL_4:

  return v8;
}

- (BOOL)applyFilterByTransactionAuthors:(id)a3 isExclusion:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if (v6)
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    else
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMChangeSet filterByTransactionAuthorStrings](self, "filterByTransactionAuthorStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[REMChangeSet filterByTransactionAuthorStrings](self, "filterByTransactionAuthorStrings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v10);

    }
    objc_msgSend(v7, "allObjects");
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v11;
  }
  v12 = -[REMChangeSet consolidateAndFilterChangesWithTransactionAuthors:isExclusion:](self, "consolidateAndFilterChangesWithTransactionAuthors:isExclusion:", v6, v4);

  return v12;
}

- (BOOL)_filterAndFlattenAndConsolidateChanges
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  REMChangeSet *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  BOOL v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  REMChangeSet *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  REMChangeSet *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  __int128 v82;
  int v83;
  int v84;
  uint64_t v85;
  void *v86;
  REMChangeSet *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id obj;
  id obja;
  void *v95;
  void *context;
  uint64_t contexta;
  void *v98;
  NSObject *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  void *v116;
  void *v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint8_t v120[4];
  uint64_t v121;
  uint8_t buf[4];
  REMChangeSet *v123;
  __int16 v124;
  void *v125;
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  -[REMChangeSet transactions](self, "transactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
  v92 = v4;
  v95 = v5;
  v87 = self;
  v88 = v6;
  if (!v8)
  {

    -[REMChangeSet setFilteredTransactions:](self, "setFilteredTransactions:", v6);
    goto LABEL_55;
  }
  v10 = v8;
  v11 = 0;
  v12 = *(_QWORD *)v113;
  *(_QWORD *)&v9 = 138412290;
  v82 = v9;
  v85 = *(_QWORD *)v113;
  v86 = v7;
  do
  {
    v13 = 0;
    obj = (id)v10;
    do
    {
      if (*(_QWORD *)v113 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v13);
      context = (void *)MEMORY[0x1B5E3DEC4]();
      v98 = v14;
      objc_msgSend(v14, "accountID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithREMChangeErrorCode:", 6);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMChangeSet setError:](self, "setError:", v36);

        +[REMLog changeTracking](REMLog, "changeTracking");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          -[REMChangeSet _filterAndFlattenAndConsolidateChanges].cold.1();

        objc_autoreleasePoolPop(context);
        -[REMChangeSet setFilteredTransactions:](self, "setFilteredTransactions:", v6);
        v4 = v92;
        goto LABEL_51;
      }
      -[REMChangeSet filterByTransactionAuthorStrings](self, "filterByTransactionAuthorStrings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v98, "author");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (-[REMChangeSet filterByTransactionAuthorsIsExclusion](self, "filterByTransactionAuthorsIsExclusion"))
        {
          if (v17)
          {
            -[REMChangeSet filterByTransactionAuthorStrings](self, "filterByTransactionAuthorStrings");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "containsObject:", v17);

            if ((v19 & 1) != 0)
              goto LABEL_44;
          }
        }
        else
        {
          if (!v17)
            goto LABEL_44;
          -[REMChangeSet filterByTransactionAuthorStrings](self, "filterByTransactionAuthorStrings");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", v17);

          if (!v21)
            goto LABEL_44;
        }

      }
      objc_msgSend(v6, "addObject:", v98, v82);
      objc_msgSend(v98, "changes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v17 = v22;
      v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
      if (!v23)
      {
        self = v87;
        v6 = v88;
        goto LABEL_43;
      }
      v24 = v23;
      v84 = v11;
      v25 = *(_QWORD *)v109;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v109 != v25)
            objc_enumerationMutation(v17);
          v27 = *(REMChangeSet **)(*((_QWORD *)&v108 + 1) + 8 * i);
          -[REMChangeSet transaction](v27, "transaction");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            v35 = os_log_create("com.apple.reminderkit", "default");
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v82;
              v123 = v27;
              _os_log_debug_impl(&dword_1B4A39000, v35, OS_LOG_TYPE_DEBUG, "Trying to populate flattened changes with a change that lost back pointer to its transaction %@.", buf, 0xCu);
            }

            v11 = 1;
            self = v87;
            v6 = v88;
            v12 = v85;
            v7 = v86;
            v10 = (uint64_t)obj;
            goto LABEL_43;
          }
          -[REMChangeSet changedObjectID](v27, "changedObjectID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            -[REMChangeSet changedObjectID](v27, "changedObjectID");
            v30 = objc_claimAutoreleasedReturnValue();
            if (-[REMChangeSet changeType](v27, "changeType") == 1)
            {
              objc_msgSend(v92, "objectForKeyedSubscript:", v30);
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = v31;
              if (v31)
              {
                -[NSObject addObject:](v31, "addObject:", v27);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v27);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "setObject:forKey:", v34, v30);

              }
LABEL_35:

              goto LABEL_36;
            }
            if (-[REMChangeSet changeType](v27, "changeType"))
            {
              if (-[REMChangeSet changeType](v27, "changeType") != 2)
              {
                +[REMLog changeTracking](REMLog, "changeTracking");
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
                  -[REMChangeSet _filterAndFlattenAndConsolidateChanges].cold.2(v120, v27, &v121, v32);
                goto LABEL_35;
              }
              objc_msgSend(v90, "addObject:", v30);
              v33 = v89;
            }
            else
            {
              objc_msgSend(v91, "addObject:", v30);
              v33 = v95;
            }
            objc_msgSend(v33, "setObject:forKey:", v27, v30);
            goto LABEL_36;
          }
          +[REMLog changeTracking](REMLog, "changeTracking");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v123 = v27;
            v124 = 2112;
            v125 = v98;
            _os_log_error_impl(&dword_1B4A39000, v30, OS_LOG_TYPE_ERROR, "chg.changedObjectID is nil! {chg: %@, txn: %@}", buf, 0x16u);
          }
LABEL_36:

        }
        v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
        if (v24)
          continue;
        break;
      }
      self = v87;
      v6 = v88;
      v12 = v85;
      v7 = v86;
      v10 = (uint64_t)obj;
      v11 = v84;
LABEL_43:

LABEL_44:
      objc_autoreleasePoolPop(context);
      ++v13;
      v5 = v95;
    }
    while (v13 != v10);
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
  }
  while (v10);

  -[REMChangeSet setFilteredTransactions:](self, "setFilteredTransactions:", v6);
  v4 = v92;
  v3 = 0x1E0C99000;
  if ((v11 & 1) == 0)
  {
LABEL_55:
    objc_msgSend(*(id *)(v3 + 3592), "dictionary", v82);
    v40 = objc_claimAutoreleasedReturnValue();
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    objc_msgSend(v4, "allValues");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
    v99 = v40;
    if (!v42)
      goto LABEL_74;
    v43 = v42;
    v44 = *(_QWORD *)v105;
    while (1)
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v105 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v45);
        v47 = (void *)MEMORY[0x1B5E3DEC4]();
        if ((unint64_t)objc_msgSend(v46, "count") < 2)
        {
          objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
          v49 = (REMChangeSet *)objc_claimAutoreleasedReturnValue();
          -[REMChangeSet changedObjectID](v49, "changedObjectID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
            goto LABEL_64;
          +[REMLog changeTracking](REMLog, "changeTracking");
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v123 = v49;
            v53 = v52;
            v54 = "rem_log_fault_if (!changedObjectID) -- Nil update change objectID {ups[0]: %@}";
            goto LABEL_72;
          }
        }
        else
        {
          objc_msgSend(v46, "sortUsingComparator:", &__block_literal_global_14);
          objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (REMChangeSet *)objc_msgSend(v48, "copyForCoalescing");

          -[REMChangeSet changedObjectID](v49, "changedObjectID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            objc_msgSend(v46, "subarrayWithRange:", 1, objc_msgSend(v46, "count") - 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMChangeSet setCoalescedChanges:](v49, "setCoalescedChanges:", v51);

            -[REMChangeSet setIsCoalesced:](v49, "setIsCoalesced:", 1);
            v40 = v99;
LABEL_64:
            -[NSObject setObject:forKey:](v40, "setObject:forKey:", v49, v50);
            goto LABEL_65;
          }
          +[REMLog changeTracking](REMLog, "changeTracking");
          v52 = objc_claimAutoreleasedReturnValue();
          v40 = v99;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v123 = v49;
            v53 = v52;
            v54 = "rem_log_fault_if (!changedObjectID) -- Nil coalesced.changeObjectID {coalesced: %@}";
LABEL_72:
            _os_log_fault_impl(&dword_1B4A39000, v53, OS_LOG_TYPE_FAULT, v54, buf, 0xCu);
          }
        }

LABEL_65:
        objc_autoreleasePoolPop(v47);
        ++v45;
      }
      while (v43 != v45);
      v55 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v104, v119, 16);
      v43 = v55;
      if (!v55)
      {
LABEL_74:

        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        obja = v91;
        v56 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
        v57 = v95;
        if (v56)
        {
          v58 = v56;
          contexta = *(_QWORD *)v101;
          do
          {
            v59 = 0;
            do
            {
              if (*(_QWORD *)v101 != contexta)
                objc_enumerationMutation(obja);
              v60 = *(REMChangeSet **)(*((_QWORD *)&v100 + 1) + 8 * v59);
              v61 = (void *)MEMORY[0x1B5E3DEC4]();
              -[NSObject objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", v60);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              if (v62)
              {
                objc_msgSend(v57, "objectForKeyedSubscript:", v60);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v63)
                {
                  +[REMLog changeTracking](REMLog, "changeTracking");
                  v68 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v123 = v60;
                    _os_log_fault_impl(&dword_1B4A39000, v68, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!ins) -- Nil change for insertedID {insertedID: %{public}@}", buf, 0xCu);
                  }

                }
                v64 = (void *)objc_msgSend(v63, "copyForCoalescing");
                objc_msgSend(v64, "setIsCoalesced:", 1);
                objc_msgSend(v62, "coalescedChanges");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                if (v65)
                {
                  v117 = v62;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "arrayByAddingObjectsFromArray:", v65);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "setCoalescedChanges:", v67);

                  v57 = v95;
                }
                else
                {
                  v116 = v62;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "setCoalescedChanges:", v66);
                }

                objc_msgSend(v57, "setObject:forKey:", v64, v60);
                v40 = v99;
                -[NSObject removeObjectForKey:](v99, "removeObjectForKey:", v60);

              }
              objc_autoreleasePoolPop(v61);
              ++v59;
            }
            while (v58 != v59);
            v69 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
            v58 = v69;
          }
          while (v69);
        }

        objc_msgSend(v90, "allObjects");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject removeObjectsForKeys:](v40, "removeObjectsForKeys:", v70);

        -[NSObject allValues](v40, "allValues");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "sortedArrayUsingComparator:", &__block_literal_global_14);
        v72 = v57;
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMChangeSet setUpdates:](v87, "setUpdates:", v73);

        objc_msgSend(v90, "allObjects");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "removeObjectsForKeys:", v74);

        objc_msgSend(obja, "allObjects");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "removeObjectsForKeys:", v75);

        objc_msgSend(v72, "allValues");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "sortedArrayUsingComparator:", &__block_literal_global_14);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMChangeSet setInserts:](v87, "setInserts:", v77);

        objc_msgSend(v89, "allValues");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "sortedArrayUsingComparator:", &__block_literal_global_14);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMChangeSet setDeletes:](v87, "setDeletes:", v79);

        +[REMLog changeTracking](REMLog, "changeTracking");
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v123 = v87;
          _os_log_impl(&dword_1B4A39000, v80, OS_LOG_TYPE_INFO, "REMChangeSet _filterAndFlattenAndConsolidateChanges was successful. ChangeSet: %@", buf, 0xCu);
        }

        v39 = 1;
        v4 = v92;
        v5 = v95;
        v6 = v88;
        goto LABEL_94;
      }
    }
  }
LABEL_51:
  +[REMLog changeTracking](REMLog, "changeTracking", v82);
  v38 = objc_claimAutoreleasedReturnValue();
  v99 = v38;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v83;
    v123 = self;
    _os_log_impl(&dword_1B4A39000, v38, OS_LOG_TYPE_INFO, "REMChangeSet _filterAndFlattenAndConsolidateChanges failed. ChangeSet: %@", buf, 0xCu);
  }
  v39 = 0;
LABEL_94:

  return v39;
}

uint64_t __54__REMChangeSet__filterAndFlattenAndConsolidateChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "transaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "compare:", v9);
  if (!v10)
  {
    v11 = objc_msgSend(v4, "changeID");
    v12 = objc_msgSend(v5, "changeID");
    if (v11 < v12)
      v10 = -1;
    else
      v10 = v11 > v12;
  }

  return v10;
}

- (BOOL)enumerateChanges:(int64_t)a3 forModelsOfClass:(Class)a4 withBlock:(id)a5
{
  char v6;
  id v8;
  void *v9;
  BOOL v10;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v8 = a5;
  if (v8)
  {
    if (!-[REMChangeSet isTruncated](self, "isTruncated"))
    {
      -[REMChangeSet error](self, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        if (!a4)
        {
          v14 = &__block_literal_global_16;
LABEL_11:
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke_2;
          v20[3] = &unk_1E67F9628;
          v21 = v14;
          v22 = v8;
          v15 = v14;
          v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E3E098](v20);
          if ((v6 & 1) != 0)
          {
            -[REMChangeSet inserts](self, "inserts");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, _QWORD))v16)[2](v16, v18, 0);

            if ((v6 & 2) == 0)
            {
LABEL_13:
              if ((v6 & 4) == 0)
              {
LABEL_15:

                v10 = 1;
LABEL_22:

                goto LABEL_5;
              }
LABEL_14:
              -[REMChangeSet deletes](self, "deletes");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *, uint64_t))v16)[2](v16, v17, 2);

              goto LABEL_15;
            }
          }
          else if ((v6 & 2) == 0)
          {
            goto LABEL_13;
          }
          -[REMChangeSet updates](self, "updates");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, uint64_t))v16)[2](v16, v19, 1);

          if ((v6 & 4) == 0)
            goto LABEL_15;
          goto LABEL_14;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[objc_class performSelector:](a4, "performSelector:", sel_cdEntityName);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
LABEL_9:
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke;
            v23[3] = &unk_1E67F95E0;
            v24 = v12;
            v13 = v12;
            v14 = (void *)MEMORY[0x1B5E3E098](v23);

            goto LABEL_11;
          }
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (((unsigned int (*)(Class, char *))-[objc_class methodForSelector:](a4, "methodForSelector:", sel_conformsToREMChangeTrackingIdentifiable))(a4, sel_conformsToREMChangeTrackingIdentifiable))
          {
            NSStringFromClass(a4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              goto LABEL_9;
          }
        }
        +[REMLog changeTracking](REMLog, "changeTracking");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          -[REMChangeSet enumerateChanges:forModelsOfClass:withBlock:].cold.1();
        v10 = 0;
        goto LABEL_22;
      }
    }
  }
  v10 = 0;
LABEL_5:

  return v10;
}

uint64_t __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  objc_msgSend(v3, "changedObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke_cold_1();

    v6 = 0;
  }

  return v6;
}

uint64_t __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke_15()
{
  return 1;
}

void __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)MEMORY[0x1B5E3DEC4](v4);
        if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32)))
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        objc_autoreleasePoolPop(v8);
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = v4;
    }
    while (v4);
  }

}

- (id)lastChangeTokenForAccountID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[REMChangeSet isTruncated](self, "isTruncated")
    || (-[REMChangeSet error](self, "error"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[REMChangeSet lastChangeTokenForAccountID:].cold.1((uint64_t)v4, self, v6);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[REMChangeSet transactions](self, "transactions", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reverseObjectEnumerator");
    v6 = objc_claimAutoreleasedReturnValue();

    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v6);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v14, "accountID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v4, "isEqual:", v15) & 1) != 0)
          {
            objc_msgSend(v14, "token");
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_6;
          }

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
          continue;
        break;
      }
    }

    +[REMLog changeTracking](REMLog, "changeTracking");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[REMChangeSet transactions](self, "transactions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v4;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_DEFAULT, "REMChangeset does not contain token for accountID (this is not an error). Returning nil {accountID: %{public}@, transactions: %@}", buf, 0x16u);

    }
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMChangeSet error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("error"));

  -[REMChangeSet transactions](self, "transactions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("transactions"));

}

- (REMChangeSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  REMChangeSet *v10;
  NSObject *v11;
  REMChangeSet *v12;
  NSObject *v14;
  uint8_t buf[4];
  REMChangeSet *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("transactions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v9, "count"))
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[REMChangeSet initWithCoder:].cold.1();

    }
    v10 = -[REMChangeSet initWithError:](self, "initWithError:", v5);
  }
  else
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v16 = self;
      _os_log_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_INFO, "REMChangeSet initWithCoder: {self=%p}", buf, 0xCu);
    }

    v10 = -[REMChangeSet initWithChangeTransactions:](self, "initWithChangeTransactions:", v9);
  }
  v12 = v10;

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)transactions
{
  return self->_transactions;
}

- (NSArray)inserts
{
  return self->_inserts;
}

- (void)setInserts:(id)a3
{
  objc_storeStrong((id *)&self->_inserts, a3);
}

- (NSArray)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_updates, a3);
}

- (NSArray)deletes
{
  return self->_deletes;
}

- (void)setDeletes:(id)a3
{
  objc_storeStrong((id *)&self->_deletes, a3);
}

- (BOOL)isTruncated
{
  return self->_isTruncated;
}

- (void)setIsTruncated:(BOOL)a3
{
  self->_isTruncated = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSArray)filterByTransactionAuthorStrings
{
  return self->_filterByTransactionAuthorStrings;
}

- (void)setFilterByTransactionAuthorStrings:(id)a3
{
  objc_storeStrong((id *)&self->_filterByTransactionAuthorStrings, a3);
}

- (BOOL)filterByTransactionAuthorsIsExclusion
{
  return self->_filterByTransactionAuthorsIsExclusion;
}

- (void)setFilterByTransactionAuthorsIsExclusion:(BOOL)a3
{
  self->_filterByTransactionAuthorsIsExclusion = a3;
}

- (NSArray)filteredTransactions
{
  return self->_filteredTransactions;
}

- (void)setFilteredTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_filteredTransactions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredTransactions, 0);
  objc_storeStrong((id *)&self->_filterByTransactionAuthorStrings, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_inserts, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

- (BOOL)isEqual:(id)a3
{
  REMChangeSet *v4;
  REMChangeSet *v5;
  REMChangeSet *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (REMChangeSet *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMChangeSet transactions](self, "transactions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMChangeSet transactions](v6, "transactions");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {
        v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        -[REMChangeSet transactions](self, "transactions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMChangeSet transactions](v6, "transactions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (void)_filterAndFlattenAndConsolidateChanges
{
  uint64_t v7;

  v7 = objc_msgSend(a2, "changeType");
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_fault_impl(&dword_1B4A39000, a4, OS_LOG_TYPE_FAULT, "Unknown persistent history change type. {changeType: %lu}", a1, 0xCu);
}

- (void)enumerateChanges:forModelsOfClass:withBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, v0, v1, "Requested change tracking for unsupported class {klass: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1B4A39000, v0, OS_LOG_TYPE_ERROR, "Missing changeEntityName {change: %@}", v1, 0xCu);
  OUTLINED_FUNCTION_3_1();
}

- (void)lastChangeTokenForAccountID:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isTruncated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "transactions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138544130;
  v10 = a1;
  v11 = 2112;
  v12 = v6;
  v13 = 2114;
  v14 = v7;
  v15 = 2112;
  v16 = v8;
  _os_log_error_impl(&dword_1B4A39000, a3, OS_LOG_TYPE_ERROR, "REMChangeSet is in error or truncated. Returning nil token for account {accountID: %{public}@, error: %@, isTruncated: %{public}@, transactions: %@}", (uint8_t *)&v9, 0x2Au);

}

- (void)initWithCoder:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_1B4A39000, v1, OS_LOG_TYPE_FAULT, "rem_log_fault_if (transactions.count != 0) -- Attempt to decode an error change set with non-empty transaction list. {error: %@, transaction: %@}", v2, 0x16u);
  OUTLINED_FUNCTION_3_1();
}

@end
